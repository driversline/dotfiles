#!/usr/bin/env fish

set -e

set target "$HOME/bspwm/dotfiles/fish/config.fish"
set directory "$HOME/.config/fish"

function create_directories
    mkdir -p $directory
end

function move_file
    mv $target $directory
end

function main
    create_directories
    move_file
end

main

exit 0
