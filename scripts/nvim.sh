#!/bin/bash

set -e

declare -A files_to_move=(
    ["$HOME/bspwm/scripts/nvim/init.vim"]="$HOME/.config/nvim"
    ["$HOME/bspwm/scripts/nvim/nvim-theme.vim"]="$HOME/.config/nvim/colors"
)

directories=(
    "$HOME/.config/nvim"
    "$HOME/.config/nvim/colors"
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
