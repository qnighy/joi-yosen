#!/usr/bin/make -f

JAVA = java
JAVAC = javac
JAVACFLAGS =

.PHONY: all clean

all: Main.class
	$(JAVA) Main < in.txt

clean:
	$(RM) Main.class

Main.class: Main.java
	$(JAVAC) $(JAVACFLAGS) *.java


