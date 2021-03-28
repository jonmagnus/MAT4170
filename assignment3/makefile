
oslo-output = output/oslo.txt

all: $(oslo-output)
	latexmk assignment3.tex

$(oslo-output) : src/test-oslo.m $(wildcard src/*)
	octave $< > $@
