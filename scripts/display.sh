#!/bin/bash

set -e

list_monitors() {
    xrandr
    echo "Available monitors | Доступные мониторы "
    xrandr | grep " connected" | cut -d' ' -f1
}

get_user_input() {
    local resolutions=("1280x720" "1366x768" "1600x900" "1920x1080" "2560x1440" "3840x2160")
    local refresh_rates=("60" "75" "120" "144" "240")

    OUTPUT=$(xrandr | grep " connected" | cut -d' ' -f1 | fzf --height 10 --border --prompt="Choose monitor | Выберите монитор ")
    if [ -z "$OUTPUT" ]; then
        echo "No monitor selected."
        exit 1
    fi

    SELECTED_RESOLUTION=$(printf "%s\n" "${resolutions[@]}" | fzf --height 10 --border --prompt="Choose resolution | Выберите расширение ")
    SELECTED_RATE=$(printf "%s\n" "${refresh_rates[@]}" | fzf --height 10 --border --prompt="Choose refresh rate | Выберите частоту обновления ")
    
    if [ -z "$SELECTED_RESOLUTION" ] || [ -z "$SELECTED_RATE" ]; then
        echo "Invalid selection | Ошибка выбора"
        exit 1
    fi
}

validate_input() {
    if ! xrandr | grep -q "$SELECTED_RESOLUTION"; then
        echo "Resolution $SELECTED_RESOLUTION is not available | Расширение $SELECTED_RESOLUTION недоступно"
        exit 1
    fi
    
    if ! xrandr | grep -q "${SELECTED_RATE}"; then
        echo "Refresh rate $SELECTED_RATE is not available | Частота обновления $SELECTED_RATE недоступна"
        exit 1
    fi
}

apply_settings() {
    XRANDR_LINE="xrandr --output $OUTPUT --mode $SELECTED_RESOLUTION --rate $SELECTED_RATE"
    sed -i "/^exec bspwm/i $XRANDR_LINE" ~/.xsession
}

main() {
    list_monitors
    get_user_input
    validate_input
    apply_settings
}

main

exit 0
