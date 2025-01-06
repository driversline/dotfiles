#!/bin/bash

set -e

list_monitors() {
    xrandr
    echo "Available monitors:"
    xrandr | grep " connected" | cut -d' ' -f1
}

get_user_input() {
    read -p "Enter the monitor name (e.g., HDMI-0): " OUTPUT
    if ! xrandr | grep -q "$OUTPUT"; then
        echo "Monitor $OUTPUT not found."
        exit 1
    fi
    
    read -p "Enter the desired resolution (e.g., 1920x1080): " SELECTED_RESOLUTION
    read -p "Enter the desired refresh rate (e.g., 60): " SELECTED_RATE
    SELECTED_RATE=${SELECTED_RATE:-60}
}

validate_input() {
    if ! xrandr | grep -q "$SELECTED_RESOLUTION"; then
        echo "Resolution $SELECTED_RESOLUTION is not available."
        exit 1
    fi
    
    if ! xrandr | grep -q "${SELECTED_RATE}"; then
        echo "Refresh rate $SELECTED_RATE is not available."
        exit 1
    fi
}

apply_settings() {
    XRANDR_LINE="xrandr --output $OUTPUT --mode $SELECTED_RESOLUTION --rate $SELECTED_RATE"
    sed -i "/^exec bspwm/i $XRANDR_LINE" ~/.xsession
    eval $XRANDR_LINE
}

main() {
    list_monitors
    get_user_input
    validate_input
    apply_settings
}

main

exit 0
