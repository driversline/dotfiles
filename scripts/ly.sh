#!/bin/bash

sudo pacman -S --noconfirm zig

systemctl disable ly.service

git clone https://github.com/fairyglade/ly && cd ly && zig build && sudo zig build installsystemd && sudo systemctl enable ly.service && sudo systemctl disable getty@tty2.service

echo "Excellent."

exit 0
