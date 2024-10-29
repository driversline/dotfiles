#!/bin/bash
sxhkd -c ~/.config/bspwm/sxhkdrc &
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
systemctl --user restart pipewire
picom --config ~/.config/picom/picom.conf &
xrandr --output HDMI-0 --mode 1920x1080 --rate 144
feh --bg-scale ~/wallpapers/x.jpg &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK
exec bspwm
