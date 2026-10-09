TT=../../build/TT/hud

ALL: \
	$(TT) \
	./exported \
	./exported/hudmap.png

$(TT):
	mkdir -p $@

./exported:
	mkdir -p $@

./exported/hudmap.png: hudmap.svg
	inkscape $< --export-filename=$@ 
	magick $@ -define dds:compression=none -define dds:mipmaps=0 $(TT)/D6406BE07F12231E.dds

