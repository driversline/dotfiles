#!/usr/bin/env bash

set -e

declare -A files_to_move=(
    ["$HOME/bspwm/dotfiles/flameshot.ini"]="$HOME/.config/flameshot"
)

directories=(
    "$HOME/.config/flameshot"
)

create_directories() {
    for dir in "${directories[@]}"; do
        mkdir -p "$dir"
    done
}

move_files() {
    for src in "${!files_to_move[@]}"; do
        dest="${files_to_move[$src]}"
        mv "$src" "$dest"
    done
}

main() {
    create_directories
    move_files
}

main

exit 0
