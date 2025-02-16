#!/usr/bin/env fish

set -e

set targets "$HOME/bspwm/dotfiles/bspwm/bspwmrc $HOME/bspwm/dotfiles/bspwm/sxhkdrc"
set directory "$HOME/.config/bspwm"

function create_directories
    mkdir -p $directory
end

function move_files
    for target in $targets
        mv $target $directory
    end
end

function make_executable
    chmod +x $directory/bspwmrc
end

function main
    create_directories
    move_files
    make_executable
end

main

exit 0
