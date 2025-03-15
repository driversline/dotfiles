#!/usr/bin/env sh

gnome-keyring-daemon --start --components=secrets # ПРИМЕР|EXAMPLE

exec bspwm
