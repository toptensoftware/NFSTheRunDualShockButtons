# NFS The Run DualShock Controller Assets

This is a set of replacement textures for NFS The Run to switch from XBox to PS/DualShock style
controller buttons. 

These have been drawn to match the original assets from the PS3 version of the game - they're
not perfect, but not bad either.


## Images

Menu buttons:

![Cross](exported/menu-cross.png)
![Square](exported/menu-square.png)
![Triangle](exported/menu-triangle.png)
![Circle](exported/menu-circle.png)

![Start](exported/menu-start.png)
![Select](exported/menu-select.png)

QTE Buttons

![Cross Up](exported/qte-cross-up.png)
![Square Up](exported/qte-square-up.png)
![Triangle Up](exported/qte-triangle-up.png)
![Circle Up](exported/qte-circle-up.png)

![Cross Down](exported/qte-cross-down.png)
![Square Down](exported/qte-square-down.png)
![Triangle Down](exported/qte-triangle-down.png)
![Circle Down](exported/qte-circle-down.png)

![Cross Cracked](exported/qte-cross-cracked.png)
![Square Cracked](exported/qte-square-cracked.png)
![Triangle Cracked](exported/qte-triangle-cracked.png)
![Circle Cracked](exported/qte-circle-cracked.png)


## What's What?

* `artwork.svg` - contains the redrawn assets.  Layer's need to be shown/hidden to configure each button
* `dualshock` - the replacement .dds textures to be used with [Texture-Toolkit](https://github.com/BadassBaboon/Texture-Toolkit)
* `dualshock/8218FC67.dds` - sprite sheet manually patched with the new assets.
* `dump` - the XBox assets as dumped from the game
* `reference` - various screen grabs from video walkthroughs of the game on PS3
* `exported` - assets in PNG format as exported from Inkscape
* `convert.sh` - script to convert the .png files to .dds and rename with correct hash

## License

MIT &copy; 2026 Topten Software - see [LICENSE](./LICENSE) for details.

