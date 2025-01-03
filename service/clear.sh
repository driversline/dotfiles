#!/bin/bash

SERVICE_DIR=~/bspwm/service

sudo cp $SERVICE_DIR/cl.service /etc/systemd/system/
sudo cp $SERVICE_DIR/cl.timer /etc/systemd/system/

sudo systemctl enable cl.timer
sudo systemctl start cl.timer

echo "Excellent."
