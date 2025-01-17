#!/bin/bash

set -e

declare -A files_to_move=(
    ["$HOME/bspwm/dotfiles/mpd.conf"]="$HOME/.config/mpd"
    ["$HOME/bspwm/dotfiles/database"]="$HOME/.config/mpd"
    ["$HOME/bspwm/dotfiles/config"]="$HOME/.config/ncmpcpp"
)

directories=(
    "$HOME/.config/mpd"
    "$HOME/.config/ncmpcpp"
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
