FIGDIR = figures
FIGURES = $(patsubst %, $(FIGDIR)/%.pdf, plotSplineCurve plotSplines)
SDIR = src
SRC = $(wildcard $(SDIR)/*)

all: $(FIGURES) $(SRC)
	latexmk assignment2.tex

$(FIGDIR)/%.pdf : $(SDIR)/%.m $(SRC)
	octave $<
