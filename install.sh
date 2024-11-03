#!/bin/bash

install_package() {
    local pkg="$1"
    if ! pacman -Qs "$pkg" > /dev/null; then
        sudo pacman -S --noconfirm "$pkg" || { echo "Ошибка установки $pkg. Завершение работы."; exit 1; }
    fi
}

packages=(bspwm kitty sxhkd ranger neovim picom feh gnome-keyring xorg-xsetroot xorg-xrandr)

for pkg in "${packages[@]}"; do
    install_package "$pkg"
done

mkdir -p $HOME/.config/bspwm $HOME/.config/picom $HOME/.config/kitty $HOME/wallpapers

cd $HOME/Downloads || { echo "Не удалось перейти в директорию $HOME/Downloads"; exit 1; }

move_file() {
    local src="$1"
    local dest="$2"
    if [ -f "$src" ]; then
        mv "$src" "$dest"
    fi
}

declare -A files_to_move=(
    [$HOME/Downloads/dotfiles/bspwmrc]=$HOME/.config/bspwm
    [$HOME/Downloads/dotfiles/sxhkdrc]=$HOME/.config/bspwm
    [$HOME/Downloads/dotfiles/picom.conf]=$HOME/.config/picom
    [$HOME/Downloads/dotfiles/kitty.conf]=$HOME/.config/kitty
    [$HOME/Downloads/dotfiles/theme.conf]=$HOME/.config/kitty
#   [$HOME/Downloads/wallpapers/paper.jpg]=$HOME/wallpapers
    [$HOME/Downloads/dotfiles/.xsession]=$HOME/
)

for src in "${!files_to_move[@]}"; do
    move_file "$src" "${files_to_move[$src]}"
done

chmod +x $HOME/.config/bspwm/bspwmrc $HOME/.xsession $HOME/Downloads/scripts/*.sh $HOME/Downloads/firefox/*.sh

echo "Дополнительные пакеты для установки:"

echo "1 - yay"

read -p "Введите номера дополнительных пакетов для установки:" -a selected_additional_indices

for index in "${selected_additional_indices[@]}"; do
    case "$index" in
        1)
            sudo pacman -S --noconfirm base-devel
            git clone https://aur.archlinux.org/yay.git /tmp/yay
            cd /tmp/yay
            makepkg -si && cd && rm -rf /tmp/yay
            ;;
        *)
            echo "Некорректный номер: $index"
            ;;
    esac
done

sudo pacman -S --noconfirm ly
sudo systemctl enable ly.service

echo "Excellent."

exit 0
