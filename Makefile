SCRIPTS_DIR = $(HOME)/bspwm/scripts

SCRIPTS = $(wildcard $(SCRIPTS_DIR)/*.fish)

all: install

install: chmod start

chmod:
	chmod +x $(SCRIPTS)

start:
	for script in $(SCRIPTS); do \
		$$script; \
		done

.PHONY: all install chmod start
