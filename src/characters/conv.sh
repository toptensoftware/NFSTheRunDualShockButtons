#!/bin/bash
[ "$(magick identify -format '%[opaque]' "$1")" = True ] && c=dxt1 || c=dxt5
magick "$1" -resize 50% -define dds:compression=$c -define dds:mipmaps=0 "$2"
