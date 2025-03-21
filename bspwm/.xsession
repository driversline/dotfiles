#!/usr/bin/env sh

gnome-keyring-daemon --start --components=secrets

exec bspwm
