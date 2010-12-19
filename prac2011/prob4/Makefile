#!/usr/bin/make -f

JAVA = java
JAVAC = javac
JAVACFLAGS =
PREFIX = 2011-pr-t4

OBJS = out1.txt out2.txt out3.txt out4.txt out5.txt

.PHONY: all clean

all: $(OBJS)

clean:
	$(RM) Main.class $(OBJS)

out1.txt: $(PREFIX)-in1.txt Main.class
	$(JAVA) Main < $< > $@
out2.txt: $(PREFIX)-in2.txt Main.class
	$(JAVA) Main < $< > $@
out3.txt: $(PREFIX)-in3.txt Main.class
	$(JAVA) Main < $< > $@
out4.txt: $(PREFIX)-in4.txt Main.class
	$(JAVA) Main < $< > $@
out5.txt: $(PREFIX)-in5.txt Main.class
	$(JAVA) Main < $< > $@

Main.class:
	$(JAVAC) $(JAVACFLAGS) *.java
	$(JAVA) Main < $(PREFIX)-in_s1.txt
	$(JAVA) Main < $(PREFIX)-in_s2.txt


