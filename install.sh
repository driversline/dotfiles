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

cd $HOME/Downloads || { echo "Не удалось перейти в директорию $HOME/Downloads. Завершение работы."; exit 1; }

packages=(bspwm kitty sxhkd vim ttf-dejavu picom feh gnome-keyring xorg-xsetroot xorg-xrandr)

for pkg in "${packages[@]}"; do
    install_package "$pkg"
done

mkdir -p $HOME/.config/bspwm $HOME/.config/picom $HOME/.config/kitty $HOME/wallpapers

declare -A files_to_move=(
    [$HOME/Downloads/config/bspwmrc]=$HOME/.config/bspwm
    [$HOME/Downloads/config/sxhkdrc]=$HOME/.config/bspwm
    [$HOME/Downloads/config/picom.conf]=$HOME/.config/picom
    [$HOME/Downloads/config/kitty.conf]=$HOME/.config/kitty
    [$HOME/Downloads/config/theme.conf]=$HOME/.config/kitty
    [$HOME/Downloads/grass.jpg]=$HOME/wallpapers
    [$HOME/Downloads/.xsession]=$HOME/
)

for src in "${!files_to_move[@]}"; do
    move_file "$src" "${files_to_move[$src]}"
done

chmod +x $HOME/.config/bspwm/bspwmrc $HOME/.xsession $HOME/Downloads/*.sh $HOME/Downloads/config/*.sh $HOME/Downloads/firefox/*.sh

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
    sudo yay -S --noconfirm cava
fi

read -p "Хотите установить nvidia-settings? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo pacman -S --noconfirm nvidia-settings
fi

read -p "Хотите установить minecraft-launcher? (y/n): " choice
if [[ "$choice" == [Yy] ]]; then
    sudo yay -S --noconfirm minecraft-launcher
fi

sudo pacman -S --noconfirm ly
sudo systemctl enable ly.service

echo "Система требует перезагрузки."

exit 0

