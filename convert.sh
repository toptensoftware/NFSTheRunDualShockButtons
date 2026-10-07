#!/bin/bash

# QTE Buttons
magick exported/qte-circle-cracked.png inject/dualshock/27F1824D1AFCB6C4.dds
magick exported/qte-circle-down.png inject/dualshock/5598383E23C67393.dds
magick exported/qte-circle-up.png inject/dualshock/6D2E0BED9C9EE316.dds
magick exported/qte-cross-cracked.png inject/dualshock/83B1500CF5BA0961.dds
magick exported/qte-cross-down.png inject/dualshock/D5FC5C89D122B87F.dds
magick exported/qte-cross-up.png inject/dualshock/B3DFA5F68C8BC282.dds
magick exported/qte-square-cracked.png inject/dualshock/83B1500CF5BA0961.dds
magick exported/qte-square-down.png inject/dualshock/8564D1B55428AAD0.dds
magick exported/qte-square-up.png inject/dualshock/FA223997906956A4.dds
magick exported/qte-triangle-cracked.png inject/dualshock/707374DF826595C7.dds
magick exported/qte-triangle-down.png inject/dualshock/0AB64365F33FB919.dds
magick exported/qte-triangle-up.png inject/dualshock/4533FD8B0436304B.dds

# QTE L2/R2 Buttons
magick exported/qte-l2r2-down.png inject/dualshock/DD53A16BABCC5E6C.dds
magick exported/qte-l2r2-up.png inject/dualshock/D2E2246027DB920F.dds
magick exported/qte-l2r2-cracked.png inject/dualshock/60244607B2236D26.dds
magick exported/qte-l2-down.png inject/dualshock/F2A2A229932BBD7C.dds
magick exported/qte-l2-up.png inject/dualshock/AB647EC537447B4E.dds
magick exported/qte-l2-cracked.png inject/dualshock/62B61365F9C9A77D.dds
magick exported/qte-r2-down.png inject/dualshock/CD099E2A3525AADB.dds
magick exported/qte-r2-up.png inject/dualshock/6D7662B3DCF678B0.dds
magick exported/qte-r2-cracked.png inject/dualshock/5A6EB3CA78039F9C.dds

# QTE Glows
magick exported/shoulder-button-glow.png inject/dualshock/F2FDB578D1742339.dds
magick exported/shoulder-buttons-glow.png inject/dualshock/9680805BB6D0827E.dds


# Menu buttons
magick exported/menu-circle.png inject/dualshock/F0821E62773F858B.dds
magick exported/menu-cross.png inject/dualshock/C8667679416EE768.dds
magick exported/menu-triangle.png inject/dualshock/6282ED8CEDB2B259.dds
magick exported/menu-start.png inject/dualshock/02F53D4F7BF30EB6.dds
magick manual-edit/E3714DDCA128992A.png -define dds:compression=none inject/dualshock/E3714DDCA128992A.dds

# Menu Arrows
magick exported/menu-arrow-1.png inject/menu/73E5B47B6A461E06.dds
magick exported/menu-arrow-2.png inject/menu/E34A3787B5977B02.dds
magick exported/menu-arrow-3.png inject/menu/000731415AA87031.dds
magick manual-edit/6F6F438E4B246110.png -define dds:compression=none inject/menu/6F6F438E4B246110.dds

# Loading Map
magick exported/mapsheet.png -define dds:compression=none inject/menu/90CE3DF27F7DCC27.dds

# Stage Maps (wip)
magick exported/stagemap1.png -define dds:compression=none inject/menu/62E1F08F61948008.dds
magick exported/stagemap2.png -define dds:compression=none inject/menu/E04CBBBE576B0C53.dds

# Hud map
magick exported/hudmap.png -define dds:compression=none inject/menu/D6406BE07F12231E.dds
