#!/bin/bash

cd

git clone https://github.com/vinceliuice/WhiteSur-firefox-theme

cd ~/WhiteSur-firefox-theme

./install.sh

cd $HOME/.mozilla/firefox/firefox-themes

sed -i '39s|^..||' "$HOME/.mozilla/firefox/firefox-themes/userChrome.css"

cd $HOME/.mozilla/firefox/firefox-themes/WhiteSur

sed -i '/padding-left:/s|3|1|' "$HOME/.mozilla/firefox/firefox-themes/WhiteSur/hide-window-buttons.css"

sed -i '8a padding-right: 1px !important;' "$HOME/.mozilla/firefox/firefox-themes/WhiteSur/hide-window-buttons.css"

cd

exit 0
