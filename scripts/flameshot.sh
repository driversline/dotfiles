#!/usr/bin/env fish

set -e

set target "$HOME/bspwm/dotfiles/flameshot/flameshot.ini"
set directory "$HOME/.config/flameshot"

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
