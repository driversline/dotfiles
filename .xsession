#!/bin/bash
sxhkd -c ~/.config/bspwm/sxhkdrc &
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
systemctl --user restart pipewire
picom --config ~/.config/picom/picom.conf &
feh --bg-scale ~/wallpapers/grass.jpg &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK
exec bspwm
