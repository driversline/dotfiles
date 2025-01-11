#!/bin/sh

set -e

HOME_DIR="$HOME"
DOTFILES_DIR="$HOME/bspwm/dotfiles"
BASHRC_DIR="$HOME/bspwm/scripts/bash"
BASHRC_FILE=".bashrc"

remove_file() {
    local file_path="$1"
    if [ -f "$file_path" ]; then
        rm -f "$file_path"
    else
        echo "File $file_path does not exist."
    fi
}

move_file() {
    local src="$1"
    local dest="$2"
    if [ -f "$src" ]; then
        mv "$src" "$dest"
    else
        echo "Source file $src does not exist."
    fi
}

main() {
    remove_file "$HOME_DIR/$BASHRC_FILE"
    move_file "$DOTFILES_DIR/$BASHRC_FILE" "$HOME_DIR/$BASHRC_FILE"
    . "$HOME_DIR/$BASHRC_FILE"
}

main

exit 0
