#!/bin/bash
sxhkd -c ~/.config/bspwm/sxhkdrc &
feh --bg-scale ~/bspwm/wallpapers/*.jpg &
gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
systemctl --user start pipewire
xset -dpms
xset s off
exec bspwm
