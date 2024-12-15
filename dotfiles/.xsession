#!/bin/bash
sxhkd -c ~/.config/bspwm/sxhkdrc &
picom --config ~/.config/bspwm/picom.conf &
feh --bg-scale ~/wallpapers/*.jpg &
gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
systemctl --user start pipewire
exec bspwm
