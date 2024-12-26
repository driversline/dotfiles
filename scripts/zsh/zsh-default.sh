#!/bin/bash

sudo pacman -Syu --noconfirm zsh

sudo chsh -s $(which zsh) $USER

echo "Excellent."
