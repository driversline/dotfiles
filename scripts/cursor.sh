#!/bin/bash

set -e

install_packages() {
    sudo pacman -S --noconfirm gtk2 gtk3
}

extract_cursors() {
    local cursor_archive="$HOME/bspwm/cursors/Nordzy-cursors-white.tar.gz"
    local local_icons_dir="$HOME/.local/share/icons"
    local system_icons_dir="/usr/share/icons"
    
    mkdir -p "$local_icons_dir"
    tar xvf "$cursor_archive" -C "$local_icons_dir"
    
    sudo tar xvf "$cursor_archive" -C "$system_icons_dir"
}

configure_gtk() {
    local gtk3_config_dir="$HOME/.config/gtk-3.0"
    local gtk2_config_file="$HOME/.gtkrc-2.0"
    local cursor_theme="Nordzy-cursors-white"
    
    mkdir -p "$gtk3_config_dir"
    echo -e '[Settings]\ngtk-cursor-theme-name='$cursor_theme >> "$gtk3_config_dir/settings.ini"
    
    echo 'gtk-cursor-theme-name="'$cursor_theme'"' >> "$gtk2_config_file"
}

configure_bspwm() {
    local bspwm_config_file="$HOME/.config/bspwm/bspwmrc"
    
    echo 'xsetroot -cursor_name left_ptr' >> "$bspwm_config_file"
}

main() {
    install_packages
    extract_cursors
    configure_gtk
    configure_bspwm
}

main

exit 0
