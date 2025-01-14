#!/bin/bash

set -e

install_zig() {
    sudo pacman -S --noconfirm zig
}

disable_ly_service() {
    sudo systemctl disable ly.service
}

clone_and_build_ly() {
    git clone https://github.com/fairyglade/ly
    cd ly
    zig build
    sudo zig build installsystemd
}

enable_ly_service() {
    sudo systemctl enable ly.service
    sudo systemctl disable getty@tty2.service
}

main() {
    install_zig
    disable_ly_service
    clone_and_build_ly
    enable_ly_service
}

main

exit 0
