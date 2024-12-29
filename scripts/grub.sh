#!/bin/bash

GRUB_CONFIG="/etc/default/grub"

sudo nvim +"/^GRUB_TIMEOUT=/s/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=1/" +wq "$GRUB_CONFIG"

sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Excellent."
