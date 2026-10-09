TT=../../build/TT/loading-map

ALL: \
	$(TT) \
	./exported \
	./exported/mapsheet.png

$(TT):
	mkdir -p $@

./exported:
	mkdir -p $@

./exported/mapsheet.png: mapsheet.svg
	inkscape $< --export-filename=$@ 
	magick $@ -define dds:compression=none -define dds:mipmaps=0 $(TT)/90CE3DF27F7DCC27.dds

