#!/bin/sh

BASHRC="$HOME/.bashrc"

sed -i "s/^PS1='.*'/PS1='>> '/" "$BASHRC"

source "$BASHRC"

