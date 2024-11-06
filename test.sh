#!/bin/bash

set -e

sudo bash -c 'echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'

install_package() {
    pacman -Qs "$1" > /dev/null || sudo pacman -S --noconfirm "$1"
}

packages=(bspwm kitty sxhkd ranger neovim picom feh gnome-keyring zig xorg-xsetroot xorg-xrandr ttf-dejavu)

for pkg in "${packages[@]}"; do
    install_package "$pkg"
done

directories=(
    "$HOME/.config/bspwm"
    "$HOME/.config/picom"
    "$HOME/.config/kitty"
    "$HOME/wallpapers"
    "$HOME/.config/neofetch"
    "$HOME/.config/nvim"
)

for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

declare -A files_to_move=(
    ["$HOME/Downloads/dotfiles/bspwmrc"]="$HOME/.config/bspwm"
    ["$HOME/Downloads/dotfiles/sxhkdrc"]="$HOME/.config/bspwm"
    ["$HOME/Downloads/dotfiles/picom.conf"]="$HOME/.config/picom"
    ["$HOME/Downloads/dotfiles/kitty.conf"]="$HOME/.config/kitty"
    ["$HOME/Downloads/dotfiles/theme.conf"]="$HOME/.config/kitty"
    ["$HOME/Downloads/wallpapers/Night.jpg"]="$HOME/wallpapers"
    ["$HOME/Downloads/dotfiles/.xsession"]="$HOME/"
)

for src in "${!files_to_move[@]}"; do
    [ -f "$src" ] && mv "$src" "${files_to_move[$src]}"
done

declare -A files_to_chmod=(
    ["$HOME/.config/bspwm/bspwmrc"]=1
    ["$HOME/.xsession"]=1
    ["$HOME/Downloads/scripts/*.sh"]=1
    ["$HOME/Downloads/firefox/*.sh"]=1
)

for file in "${!files_to_chmod[@]}"; do
    chmod +x $file
done

echo -e "Additional packages for installation:\n1 | yay\n2 | cava\n3 | spotify\n4 | neofetch\n5 | minecraft-launcher\n6 | openrgb"

read -p "Enter package numbers for installation: " -a selected_additional_indices

declare -A package_commands=(
    [1]="sudo pacman -S --noconfirm base-devel && git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si --noconfirm && rm -rf /tmp/yay"
    [2]="yay -S --noconfirm cava"
    [3]="sudo pacman -S --noconfirm spotify"
    [4]="sudo pacman -S --noconfirm neofetch"
    [5]="yay -S --noconfirm minecraft-launcher"
    [6]="yay -S --noconfirm openrgb"
)

for index in "${selected_additional_indices[@]}"; do
    if [[ -n "${package_commands[$index]}" ]]; then
        eval "${package_commands[$index]}"
    else
        echo "Incorrect number: $index"
    fi
done

git clone https://github.com/fairyglade/ly && cd ly && zig build && sudo zig build installsystemd && sudo systemctl enable ly.service && sudo systemctl disable getty@tty2.service

echo "Excellent. You can reboot system."

exit 0
