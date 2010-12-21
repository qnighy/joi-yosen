#!/usr/bin/make -f

CS = gmcs
RUNNET = mono
PREFIX = 2011-yo-t3

OBJS = out1.txt out2.txt out3.txt out4.txt out5.txt

.PHONY: all clean

all: $(OBJS)

clean:
	$(RM) Main.exe $(OBJS)

out1.txt: $(PREFIX)-in1.txt Main.exe
	$(RUNNET) Main.exe < $< > $@
out2.txt: $(PREFIX)-in2.txt Main.exe
	$(RUNNET) Main.exe < $< > $@
out3.txt: $(PREFIX)-in3.txt Main.exe
	$(RUNNET) Main.exe < $< > $@
out4.txt: $(PREFIX)-in4.txt Main.exe
	$(RUNNET) Main.exe < $< > $@
out5.txt: $(PREFIX)-in5.txt Main.exe
	$(RUNNET) Main.exe < $< > $@

Main.exe: Main.cs
	$(CS) Main.cs
	$(RUNNET) Main.exe < $(PREFIX)-in_s1.txt
	$(RUNNET) Main.exe < $(PREFIX)-in_s2.txt


