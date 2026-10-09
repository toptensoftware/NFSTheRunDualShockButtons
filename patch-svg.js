#!/usr/bin/env node

// Shows/hides elements in an SVG file by matching their inkscape:label.
//
//   node patch-svg.js input.svg output.svg --hide label1 --hide label2 --show label3
//   node patch-svg.js input.svg output.svg --hide:label1:label2 --show:label3
//
// Multiple labels can be given to one option by separating them with colons.
//
// Labels match if the element's inkscape:label contains the string (case
// insensitive).  If an element matches more than one option, the last one on
// the command line wins.
//
// The file is patched in place textually (only the start tags of matching
// elements are rewritten) so the rest of the document is left byte-for-byte
// as Inkscape wrote it.

const fs = require('fs');

function usage(msg) {
    if (msg)
        console.error(`error: ${msg}\n`);
    console.error('usage: node patch-svg.js <input.svg> <output.svg> [--hide <label>[:<label>...]]... [--show <label>[:<label>...]]...');
    process.exit(msg ? 1 : 0);
}

// Parse command line
const files = [];
const rules = [];       // { hide: bool, label: lowercased string, hits: number }
const args = process.argv.slice(2);
for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === '--help' || arg === '-h') {
        usage();
    } else if (/^--(hide|show)([:=]|$)/.test(arg)) {
        // Labels are either attached (--hide:a:b or --hide=a:b) or the next arg
        const opt = arg.slice(0, 6);
        let labels;
        if (arg.length > 6) {
            labels = arg.slice(7);
        } else {
            if (i + 1 >= args.length)
                usage(`${arg} requires a label`);
            labels = args[++i];
        }
        labels = labels.split(':').map(l => l.trim()).filter(l => l !== '');
        if (labels.length === 0)
            usage(`${opt} requires a label`);
        for (const label of labels)
            rules.push({ hide: opt === '--hide', label: label.toLowerCase(), hits: 0 });
    } else if (arg.startsWith('--')) {
        usage(`unknown option ${arg}`);
    } else {
        files.push(arg);
    }
}
if (files.length !== 2)
    usage('expected an input file and an output file');

function decodeEntities(str) {
    return str.replace(/&(#x[0-9a-f]+|#\d+|lt|gt|amp|quot|apos);/gi, (m, e) => {
        switch (e.toLowerCase()) {
            case 'lt': return '<';
            case 'gt': return '>';
            case 'amp': return '&';
            case 'quot': return '"';
            case 'apos': return "'";
        }
        return String.fromCodePoint(e[1].toLowerCase() === 'x' ? parseInt(e.slice(2), 16) : parseInt(e.slice(1), 10));
    });
}

// Set the display property of a style string to none or inline.  When showing,
// a style with no display property is left alone.  Returns the new style string.
function patchStyle(style, hide) {
    const decls = style.split(';');
    let found = false;
    for (let i = 0; i < decls.length; i++) {
        const m = decls[i].match(/^(\s*display\s*:\s*)[^!]*?(\s*(?:!.*)?)$/i);
        if (m) {
            decls[i] = `${m[1]}${hide ? 'none' : 'inline'}${m[2]}`;
            found = true;
        }
    }
    if (found || !hide)
        return decls.join(';');
    return style.trim() === '' ? 'display:none' : `display:none;${style}`;
}

// Rewrite the attributes of a start tag to hide or show the element
function patchAttributes(attrs, hide) {
    // A display attribute is redundant once the style is set (style wins) and
    // would only hide the element when showing, so just drop it
    attrs = attrs.filter(a => a.name !== 'display');

    const style = attrs.find(a => a.name === 'style');
    if (style) {
        style.value = patchStyle(style.value, hide);
    } else if (hide) {
        // Use the same leading whitespace as the other attributes
        const last = attrs[attrs.length - 1];
        attrs.push({ lead: last ? last.lead : ' ', name: 'style', eq: '=', quote: '"', value: 'display:none' });
    }
    return attrs;
}

// Matches comments, CDATA sections and processing instructions (so they can be
// skipped) or an element start tag (captures: name, attributes, self close)
const rxToken = /<!--[\s\S]*?-->|<!\[CDATA\[[\s\S]*?\]\]>|<\?[\s\S]*?\?>|<([A-Za-z_][\w:.\-]*)((?:\s+[^\s=<>\/]+\s*=\s*(?:"[^"]*"|'[^']*'))*)(\s*\/?>)/g;
const rxAttr = /(\s+)([^\s=<>\/]+)(\s*=\s*)(["'])([\s\S]*?)\4/g;

let patched = 0;
const input = fs.readFileSync(files[0], 'utf8');
const output = input.replace(rxToken, (token, name, attrText, close) => {
    if (name === undefined)
        return token;

    let attrs = [...attrText.matchAll(rxAttr)].map(m => ({ lead: m[1], name: m[2], eq: m[3], quote: m[4], value: m[5] }));

    const labelAttr = attrs.find(a => a.name === 'inkscape:label');
    if (!labelAttr)
        return token;
    const label = decodeEntities(labelAttr.value).toLowerCase();

    // Last matching rule wins
    let rule = null;
    for (const r of rules) {
        if (label.includes(r.label)) {
            r.hits++;
            rule = r;
        }
    }
    if (!rule)
        return token;

    attrs = patchAttributes(attrs, rule.hide);
    patched++;
    return `<${name}${attrs.map(a => `${a.lead}${a.name}${a.eq}${a.quote}${a.value}${a.quote}`).join('')}${close}`;
});

fs.writeFileSync(files[1], output, 'utf8');

for (const r of rules) {
    if (r.hits === 0)
        console.error(`warning: no elements matched ${r.hide ? '--hide' : '--show'} ${r.label}`);
}
console.log(`${files[1]}: ${patched} element(s) patched`);
