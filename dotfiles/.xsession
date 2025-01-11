#!/bin/bash
sxhkd -c ~/.config/bspwm/sxhkdrc &
feh --bg-scale ~/bspwm/wallpapers/*.jpg &
exec bspwm
