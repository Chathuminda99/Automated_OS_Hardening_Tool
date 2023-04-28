#!/bin/bash

# Check if the /var/log partition is mounted
if grep -qs '/var/log' /proc/mounts; then
  # Check if the /var/log partition is already configured with the nosuid option
  if ! grep -qs '/var/log' /etc/fstab || ! grep -q 'nosuid' /etc/fstab; then
    # Add the nosuid option to the /var/log partition in the /etc/fstab file
    sed -i.bak 's|\(/var/log\s\+\S\+\s\+\S\+\s\+\)\(\S*\)\s\+\(.*$\)|\1\2,nosuid \3|' /etc/fstab
    # Remount the /var/log partition with the new options
    mount -o remount /var/log
    echo "Remediated the /var/log partition with the nosuid option."
  else
    echo "The /var/log partition is already configured with the nosuid option."
  fi
else
  echo "The /var/log partition is not mounted."
fi
