#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

THEME_DIR="$HOME/bspwm/themes"
mkdir -p "$THEME_DIR"

git clone https://github.com/romkatv/powerlevel10k.git "$THEME_DIR/powerlevel10k"

sed -i "s|ZSH_THEME=\".*\"|ZSH_THEME=\"powerlevel10k/powerlevel10k.zsh-theme\"|" ~/.zshrc

echo "Excellent."
