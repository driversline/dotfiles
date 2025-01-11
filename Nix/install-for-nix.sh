#!/bin/bash

set -e

directories=(
    "$HOME/.config/bspwm"
    "$HOME/.config/alacritty"
)

for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

declare -A files_to_move=(
    ["$HOME/bspwm/dotfiles/bspwmrc"]="$HOME/.config/bspwm"
    ["$HOME/bspwm/dotfiles/sxhkdrc"]="$HOME/.config/bspwm"
    ["$HOME/bspwm/dotfiles/alacritty.toml"]="$HOME/.config/alacritty"
    ["$HOME/bspwm/dotfiles/.xsession"]="$HOME/"
)

for src in "${!files_to_move[@]}"; do
    [ -f "$src" ] && mv "$src" "${files_to_move[$src]}"
done

declare -A files_to_chmod=(
    ["$HOME/.config/bspwm/bspwmrc"]=1
    ["$HOME/.xsession"]=1
)

for file in "${!files_to_chmod[@]}"; do
    chmod +x "$file"
done

source "$HOME/bspwm/scripts/display.sh"
source "$HOME/bspwm/scripts/cursor.sh"

echo -e "Additional packages for installation:\n1 | cava\n2 | spotify\n3 | neofetch\n4 | openrgb\n5 | openjdk\n6 | gradle\n7 | vscode\n8 | flameshot"

read -p "Enter package numbers for installation: " -a selected_additional_indices

declare -A package_commands=(
    [1]="nix-env -iA nixpkgs.cava"
    [2]="nix-env -iA nixpkgs.spotify"
    [3]="nix-env -iA nixpkgs.neofetch"
    [4]="nix-env -iA nixpkgs.openrgb"
    [5]="nix-env -iA nixpkgs.jdk-openjdk"
    [6]="nix-env -iA nixpkgs.gradle"
    [7]="nix-env -iA nixpkgs.vscode"
    [8]="nix-env -iA nixpkgs.flameshot"
)

for index in "${selected_additional_indices[@]}"; do
    if [[ -n "${package_commands[$index]}" ]]; then
        eval "${package_commands[$index]}"
    else
        echo "Incorrect number: $index"
    fi
done

echo "Excellent. You can reboot the system now."

exit 0
