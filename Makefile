SCRIPTS_DIR = $(HOME)/bspwm/scripts

SCRIPTS = $(wildcard $(SCRIPTS_DIR)/*.fish)

all: install

install:
	chmod +x $(SCRIPTS)
	for script in $(SCRIPTS); do \
		$script; \
	done

.PHONY: all install
