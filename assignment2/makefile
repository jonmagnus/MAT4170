FIGDIR = figures
FIGURES = $(patsubst %, $(FIGDIR)/%.pdf, plotSplineCurve plotSplines plotWholeCubic)
SDIR = src
SRC = $(wildcard $(SDIR)/*)

all: $(FIGURES) $(SRC)
	latexmk assignment2.tex

$(FIGDIR)/plotSplineCurve.pdf : $(SDIR)/plotSplineCurve.m $(SDIR)/findKnotInterval.m $(SDIR)/computeSplinePoint.m
	octave $<

$(FIGDIR)/plotSplines.pdf : $(SDIR)/plotSplines.m $(SDIR)/findKnotInterval.m $(SDIR)/evaluateSpline.m
	octave $<

$(FIGDIR)/plotWholeCubic.pdf : $(SDIR)/plotWholeCubic.m $(SDIR)/findKnotInterval.m $(SDIR)/evaluateSpline.m
	octave $<
