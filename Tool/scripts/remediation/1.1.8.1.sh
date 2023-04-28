#!/bin/bash

# Check if /dev/shm is already in /etc/fstab
if grep -q "/dev/shm" /etc/fstab; then
  # If it exists, replace the fourth field with "defaults,nodev"
  sed -i 's/\(\/dev\/shm.*\)defaults\(.*\)/\1defaults,nodev\2/' /etc/fstab
else
  # If it doesn't exist, add "/dev/shm tmpfs defaults,nodev 0 0" to the end of /etc/fstab
  echo "/dev/shm tmpfs defaults,nodev 0 0" >> /etc/fstab
fi

# Remount /dev/shm with the updated options
if mount -o remount /dev/shm; then
  echo "Remounted /dev/shm with nodev option"
else
  echo "Failed to remount /dev/shm with nodev option"
fi
