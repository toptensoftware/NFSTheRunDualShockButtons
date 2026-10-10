NFSDIR := "../../Games/Need for Speed The Run"
NFSEXE := "Need For Speed The Run.exe"
PACKAGE := NFSTRTheRunTexturePack.zip

SUBDIRS := $(patsubst %/Makefile,%,$(wildcard src/*/Makefile))

SUBGOALS := $(filter clean,$(MAKECMDGOALS))

GOALS := all clean

.PHONY: all clean deploy package run $(SUBDIRS)

all: $(SUBDIRS)

clean: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(SUBGOALS)

deploy: all
	@echo Deploying...
	cp -ur ./build/TT/* $(NFSDIR)/TT/

package: all
	@echo Packaging...
	rm -f $(PACKAGE)
	cd build && zip -r ../$(PACKAGE) .

run:
	@echo Running...
	$(NFSDIR)/$(NFSEXE)
