#!/usr/bin/make -f

HC = ghc
HCFLAGS = -O2 -package containers
PREFIX = 2011-yo-t6
RTSOPTS = -K64m
CMD = ./Main +RTS $(RTSOPTS) -RTS --RTS

OBJS = out1.txt out2.txt out3.txt out4.txt out5.txt

.PHONY: all clean

all: $(OBJS)

clean:
	$(RM) Main Main.o Main.hi $(OBJS)

out1.txt: $(PREFIX)-in1.txt Main
	$(CMD) < $< > $@
out2.txt: $(PREFIX)-in2.txt Main
	$(CMD) < $< > $@
out3.txt: $(PREFIX)-in3.txt Main
	$(CMD) < $< > $@
out4.txt: $(PREFIX)-in4.txt Main
	$(CMD) < $< > $@
out5.txt: $(PREFIX)-in5.txt Main
	$(CMD) < $< > $@

Main: Main.hs
	$(HC) $(HCFLAGS) $< -o $@
	$(CMD) < $(PREFIX)-in_s1.txt
	$(CMD) < $(PREFIX)-in_s2.txt
	$(CMD) < $(PREFIX)-in_s3.txt
	$(CMD) < $(PREFIX)-in_s4.txt


