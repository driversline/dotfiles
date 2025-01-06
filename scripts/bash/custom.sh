#!/bin/sh

HOME_DIR="$HOME"
BASHRC_DIR="$HOME/bspwm/scripts/bash"

rm -f "$HOME_DIR/.bashrc"

mv "$BASHRC_DIR/.bashrc" "$HOME_DIR/.bashrc"

source "$HOME_DIR/.bashrc"
