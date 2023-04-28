#!/bin/bash

# Check if the /var/log partition exists
if lsblk | grep -q /var/log; then
  # Add noexec to the fourth field (mounting options) for the /var/log partition in the /etc/fstab file
  sudo sed -i 's/\(.*\)\/var\/log\(.*defaults.*\)/\1\/var\/log\2,noexec/' /etc/fstab

  # Remount the /var/log partition with the new configuration
  sudo mount -o remount /var/log
fi
