#!/usr/bin/env bash

# Check if /var partition exists
if grep -q '/var' /etc/fstab; then
    echo "Found /var partition in /etc/fstab. Adding nodev option and remounting..."
    # Backup /etc/fstab
    cp /etc/fstab /etc/fstab.bak
    # Add nodev option to /var partition in /etc/fstab
    sed -i '/\/var/ s/defaults/defaults,nodev/' /etc/fstab
    # Remount /var with new options
    mount -o remount /var
    echo "Done."
else
    echo "/var partition not found in /etc/fstab."
fi
