#!/usr/bin/make -f

HC = ghc
PREFIX = 2011-yo-t4

OBJS = out1.txt out2.txt out3.txt out4.txt out5.txt

.PHONY: all clean

all: $(OBJS)

clean:
	$(RM) Main Main.o Main.hi $(OBJS)

out1.txt: $(PREFIX)-in1.txt Main
	./Main < $< > $@
out2.txt: $(PREFIX)-in2.txt Main
	./Main < $< > $@
out3.txt: $(PREFIX)-in3.txt Main
	./Main < $< > $@
out4.txt: $(PREFIX)-in4.txt Main
	./Main < $< > $@
out5.txt: $(PREFIX)-in5.txt Main
	./Main < $< > $@

Main: Main.hs
	$(HC) $< -o $@
	./Main < $(PREFIX)-in_s1.txt
	./Main < $(PREFIX)-in_s2.txt


