#!/bin/bash

set -e

install_cpupower() {
    sudo pacman -S --noconfirm cpupower
}

display_frequency_info() {
    cpupower frequency-info
}

set_frequency() {
    echo -n "Select frequency (default 2.4GHz | e.g. 2.67GHz): "
    read frequency
    frequency=${frequency:-2.4GHz}

    XRANDR_LINE="cpupower frequency-set -f $frequency"
    sed -i "/^exec bspwm/i $XRANDR_LINE" ~/.xsession

    sudo cpupower frequency-set -f "$frequency"
}

main() {
    install_cpupower
    display_frequency_info
    set_frequency
}

main

exit 0
