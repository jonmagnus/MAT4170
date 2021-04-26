
IDIR = input
INPUT = $(patsubst %, $(IDIR)/hj%.dat, $(shell seq 1 9))
SRC = $(shell find src -name \*.m)

generate-output: $(SRC) problem2.m problem1.m
	octave problem2.m
	#octave problem1.m

fetch-input: $(INPUT)

clean:
	rm $(INPUT)

$(IDIR)/%:
	curl $(patsubst $(IDIR)/%, https://www.uio.no/studier/emner/matnat/math/MAT4170/v21/forelesningsvideoer/data-oblig-4/%, $@) > $@
