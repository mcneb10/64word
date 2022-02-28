# makefile for c64 stuff

FILES = Main.prg Main2.prg Main3.prg

.PHONY: all
all: $(FILES)

%.prg: %.asm
	java -jar KickAss.jar $<
