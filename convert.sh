#!/bin/bash

# QTE Buttons
magick exported/qte-circle-cracked.png dualshock/C7FD7CF6.dds
magick exported/qte-circle-down.png dualshock/15B03C5F.dds
magick exported/qte-circle-up.png dualshock/7301A671.dds
magick exported/qte-cross-cracked.png dualshock/469A4616.dds
magick exported/qte-cross-down.png dualshock/EF7633F2.dds
magick exported/qte-cross-up.png dualshock/450234F8.dds
magick exported/qte-square-cracked.png dualshock/527B8024.dds
magick exported/qte-square-down.png dualshock/435486ED.dds
magick exported/qte-square-up.png dualshock/8C3FD691.dds
magick exported/qte-triangle-cracked.png dualshock/B1BBAD65.dds
magick exported/qte-triangle-down.png dualshock/0193AB11.dds
magick exported/qte-triangle-up.png dualshock/15391220.dds

# Menu buttons
magick exported/menu-circle.png dualshock/502312E0.dds
magick exported/menu-cross.png dualshock/F5B15FB2.dds
magick exported/menu-triangle.png dualshock/BA7523D0.dds
magick exported/menu-start.png dualshock/C6E3889F.dds

# Note: other controller buttons are located in 8218FC67.dds and need to be manually placed

# Menu Arrows
magick exported/menu-arrow-1.png menu/FE606D28.dds
magick exported/menu-arrow-2.png menu/D51A766D.dds
magick exported/menu-arrow-3.png menu/81CE829D.dds

# No compression on these menu assets
magick menu/4D424977.png -define dds:compression=none menu/4D424977.dds
