
IDIR = input
INPUT = $(patsubst %, $(IDIR)/hj%.dat, $(shell seq 1 9))
SRC = $(shell find src -name \*.m)
FIGDIR = figures
FIGS = $(patsubst %, $(FIGDIR)/problem%.pdf, 1 2)
BDIR = build

all: assignment4.tex $(FIGS) $(SRC) $(INPUT)
	latexmk -pdf -outdir=$(BDIR)

$(FIGDIR)/%.pdf : %.m $(SRC) $(INPUT)
	octave $<

fetch-input: $(INPUT)

clean:
	rm $(INPUT) $(FIGS) $(BDIR)/*

$(IDIR)/%:
	curl $(patsubst $(IDIR)/%, https://www.uio.no/studier/emner/matnat/math/MAT4170/v21/forelesningsvideoer/data-oblig-4/%, $@) > $@
