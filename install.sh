#!/bin/bash

install_package() {
    local pkg="$1"
    if ! pacman -Qs "$pkg" > /dev/null; then
        sudo pacman -S --noconfirm "$pkg" || { echo "Ошибка установки $pkg. Завершение работы."; exit 1; }
    fi
}

move_file() {
    local src="$1"
    local dest="$2"
    if [ -f "$src" ]; then
        mv "$src" "$dest"
    fi
}

cd ~/Downloads || { echo "Не удалось перейти в директорию ~/Downloads. Завершение работы."; exit 1; }

packages=(bspwm kitty sxhkd vim ttf-dejavu picom feh gnome-keyring xorg-xsetroot xorg-xrandr)

for pkg in "${packages[@]}"; do
    install_package "$pkg"
done

mkdir -p ~/.config/bspwm ~/.config/picom ~/.config/kitty ~/wallpapers

declare -A files_to_move=(
    [~/Downloads/config/bspwmrc]=~/.config/bspwm
    [~/Downloads/config/sxhkdrc]=~/.config/bspwm
    [~/Downloads/config/picom.conf]=~/.config/picom
    [~/Downloads/config/kitty.conf]=~/.config/kitty
    [~/Downloads/config/theme.conf]=~/.config/kitty
    [~/Downloads/grass.jpg]=~/wallpapers
    [~/Downloads/.xsession]=~/
)

for src in "${!files_to_move[@]}"; do
    move_file "$src" "${files_to_move[$src]}"
done

chmod +x ~/.config/bspwm/bspwmrc ~/.xsession ~/Downloads/*.sh

./display.sh
./cpu.sh

read -p "Хотите установить yay? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm base-devel
    if [ ! -d "$HOME/.yay" ]; then
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay || exit 1
        makepkg -si --noconfirm
        rm -rf /tmp/yay
    fi
fi

read -p "Хотите установить cava? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    yay -S --noconfirm cava
fi

read -p "Хотите установить nvidia-settings? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm nvidia-settings
fi

read -p "Хотите установить minecraft-launcher? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    yay -S --noconfirm minecraft-launcher
fi

sudo pacman -S --noconfirm ly
sudo systemctl enable ly.service

echo "Система требует перезагрузки."

exit 0
