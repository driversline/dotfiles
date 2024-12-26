#!/bin/bash

declare -A files_to_move=(
    ["$HOME/bspwm/scripts/nvim/init.vim"]="$HOME/.config/nvim"
    ["$HOME/bspwm/scripts/nvim/nvim-theme.vim"]="$HOME/.config/nvim/colors"
)

directories=(
    "$HOME/.config/nvim"
    "$HOME/.config/nvim/colors"
)

for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

for src in "${!files_to_move[@]}"; do
    dest="${files_to_move[$src]}"
    mv "$src" "$dest"
done
