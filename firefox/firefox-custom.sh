#!/bin/bash

set -e

clone_theme_repo() {
    local repo_url="https://github.com/vinceliuice/WhiteSur-firefox-theme"
    local clone_dir="$HOME/WhiteSur-firefox-theme"
    
    if [ ! -d "$clone_dir" ]; then
        git clone "$repo_url" "$clone_dir"
    fi
}

install_theme() {
    local install_dir="$HOME/WhiteSur-firefox-theme"
    
    if [ -d "$install_dir" ]; then
        cd "$install_dir"
        ./install.sh -m
    else
        echo "Installation directory not found: $install_dir"
        exit 1
    fi
}

modify_userChrome() {
    local user_chrome="$HOME/.mozilla/firefox/firefox-themes/userChrome.css"
    
    if [ -f "$user_chrome" ]; then
        sed -i '39s|^..||' "$user_chrome"
    else
        echo "userChrome.css not found: $user_chrome"
        exit 1
    fi
}

modify_hide_window_buttons() {
    local css_file="$HOME/.mozilla/firefox/firefox-themes/WhiteSur/hide-window-buttons.css"
    
    if [ -f "$css_file" ]; then
        sed -i '/padding-left:/s|3|1|' "$css_file"
        sed -i '8a padding-right: 1px !important;' "$css_file"
    else
        echo "hide-window-buttons.css not found: $css_file"
        exit 1
    fi
}

main() {
    clone_theme_repo
    install_theme
    modify_userChrome
    modify_hide_window_buttons
}

main

exit 0
