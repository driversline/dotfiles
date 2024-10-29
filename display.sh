#!/bin/bash

echo "xrandr output:"
xrandr

echo "Available monitors:"
xrandr | grep " connected" | cut -d' ' -f1

read -p "Enter the monitor name (e.g., HDMI-0): " OUTPUT

if xrandr | grep -q "$OUTPUT"; then
    read -p "Enter the desired resolution (e.g., 1920x1080): " SELECTED_RESOLUTION
    read -p "Enter the desired refresh rate (default 60): " SELECTED_RATE
    SELECTED_RATE=${SELECTED_RATE:-60}

    if xrandr | grep -q "$SELECTED_RESOLUTION" && xrandr | grep -q "${SELECTED_RATE}"; then
        XRANDR_LINE="xrandr --output $OUTPUT --mode $SELECTED_RESOLUTION --rate $SELECTED_RATE"
        sed -i "/^exec bspwm/i $XRANDR_LINE" ~/.xsession
        eval $XRANDR_LINE
    else
        echo "The selected values are not available."
    fi
else
    echo "Monitor $OUTPUT not found."
fi
