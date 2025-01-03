#!/bin/bash

if ! command -v fstrim &> /dev/null; then
    echo "Ошибка: fstrim не установлен. Установите его и попробуйте снова."
    exit 1
fi

SERVICE_DIR=$HOME/bspwm/service

sudo cp $SERVICE_DIR/cl.service /etc/systemd/system/
sudo cp $SERVICE_DIR/cl.timer /etc/systemd/system/

sudo systemctl enable cl.timer
sudo systemctl start cl.timer

echo "Excellent."
