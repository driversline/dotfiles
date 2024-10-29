#!/bin/bash

sudo pacman -S --noconfirm cpupower

echo "Processor information:"
cpupower frequency-info

echo -n "Select frequency (default 2.4GHz | don't forget to append GHz at the end): "
read frequency
frequency=${frequency:-2.4GHz}

XRANDR_LINE="cpupower frequency-set -f $frequency"
sed -i "/^exec bspwm/i $XRANDR_LINE" ~/.xsession

sudo cpupower frequency-set -f "$frequency"
