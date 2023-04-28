#!/bin/bash

# Check if /var partition exists
if [ ! -d "/var" ]; then
  echo "ERROR: /var partition does not exist"
  exit 1
fi

# Add nosuid option to /var partition in /etc/fstab
sed -i '/\/var/ s/defaults/defaults,nosuid/' /etc/fstab

# Remount /var with new options
mount -o remount /var

# Check if remount was successful
if [ $? -eq 0 ]; then
  echo "SUCCESS: /var remounted with nosuid option"
else
  echo "ERROR: Failed to remount /var with nosuid option"
  exit 1
fi
