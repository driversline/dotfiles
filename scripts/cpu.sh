#!/bin/bash

sudo pacman -S --noconfirm cpupower

cpupower frequency-info

echo -n "Select frequency (default 2.4GHz | e.g. 2.67GHz): "
read frequency
frequency=${frequency:-2.4GHz}

XRANDR_LINE="cpupower frequency-set -f $frequency"
sed -i "/^exec bspwm/i $XRANDR_LINE" ~/.xsession

sudo cpupower frequency-set -f "$frequency"

echo "Excellent."

exit 0
