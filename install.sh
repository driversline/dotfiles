#!/bin/bash

install_package() {
    local pkg="$1"
    if ! pacman -Qs "$pkg" > /dev/null; then
        sudo pacman -S --noconfirm "$pkg" || { echo "Ошибка установки $pkg. Завершение работы."; exit 1; }
    fi
}

packages=(bspwm kitty sxhkd polybar ranger vim picom feh gnome-keyring xorg-xsetroot xorg-xrandr)

for pkg in "${packages[@]}"; do
    install_package "$pkg"
done

mkdir -p $HOME/.config/bspwm $HOME/.config/picom $HOME/.config/kitty $HOME/.config/polybar $HOME/wallpapers

cd $HOME/Downloads || { echo "Не удалось перейти в директорию $HOME/Downloads. Завершение работы."; exit 1; }

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
    [$HOME/Downloads/dotfiles/config.ini]=$HOME/.config/polybar
    [$HOME/Downloads/dotfiles/picom.conf]=$HOME/.config/picom
    [$HOME/Downloads/dotfiles/kitty.conf]=$HOME/.config/kitty
    [$HOME/Downloads/dotfiles/theme.conf]=$HOME/.config/kitty
   # [$HOME/Downloads/wallpapers/grass.jpg]=$HOME/wallpapers
    [$HOME/Downloads/dotfiles/.xsession]=$HOME/
)

for src in "${!files_to_move[@]}"; do
    move_file "$src" "${files_to_move[$src]}"
done

chmod +x $HOME/.config/bspwm/bspwmrc $HOME/.xsession $HOME/Downloads/*.sh $HOME/Downloads/firefox/*.sh

echo "Дополнительные пакеты для установки:"
echo "1. yay"
echo "2. cava"
echo "3. nvidia-settings"
echo "4. minecraft-launcher"

read -p "Введите номера дополнительных пакетов для установки (через пробел), учтите что cava и minecraft-launcher не установятся без yay (пример: 1 2 4): " -a selected_additional_indices

for index in "${selected_additional_indices[@]}"; do
    case "$index" in
        1)
            sudo pacman -S --noconfirm base-devel
            git clone https://aur.archlinux.org/yay.git /tmp/yay
            cd /tmp/yay
            makepkg -si && cd && rm -rf /tmp/yay
        2)
            yay -S --noconfirm cava
        3)
            sudo pacman -S --noconfirm nvidia-settings
        4)
            yay -S --noconfirm minecraft-launcher
        *)
            echo "Некорректный номер: $index"
            ;;
    esac
done

sudo pacman -S --noconfirm ly
sudo systemctl enable ly.service

echo "Система требует перезагрузки."

exit 0
