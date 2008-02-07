DJVULIBRE_BIN_PATH = $(shell pkg-config --variable exec_prefix ddjvuapi)/bin
POPPLER_VERSION = $(shell ./tools/get-poppler-version)
EXT_CFLAGS = $(shell pkg-config --cflags poppler-splash ddjvuapi) -DPOPPLER_VERSION=$(POPPLER_VERSION)
EXT_LDFLAGS = $(shell pkg-config --libs poppler-splash ddjvuapi)

CXXFLAGS ?= -Wall -O3
override LDFLAGS += $(EXT_LDFLAGS)
override CXXFLAGS += $(EXT_CFLAGS) -DDJVULIBRE_BIN_PATH="\"$(strip $(DJVULIBRE_BIN_PATH))\""

.PHONY: all
all: pdf2djvu

config.o: config.cc config.hh debug.hh
debug.o: debug.cc debug.hh config.hh
compoppler.o: compoppler.cc compoppler.hh
system.o: system.cc system.hh debug.hh
pdf2djvu.o: pdf2djvu.cc compoppler.hh debug.hh config.hh system.hh version.hh
pdf2djvu: pdf2djvu.o compoppler.o debug.o config.o system.o
	$(LINK.cc) $(^) -o $(@) 

.PHONY: clean
clean:
	$(RM) pdf2djvu *.o version.hh

.PHONY: test
test: pdf2djvu
	$(MAKE) -C tests/

version.hh:
	./tools/get-pdf2djvu-version > $(@)

# vim:ts=4 sw=4 noet
