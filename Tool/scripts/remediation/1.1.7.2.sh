#!/bin/bash

# Check if /home partition exists in /etc/fstab
if grep -q "/home" /etc/fstab; then
    # Add nodev option to /home partition in /etc/fstab
    sed -i 's/\(^.*\/home.*\)\(defaults.*$\)/\1\2,nodev/' /etc/fstab
    
    # Remount /home partition with new options
    mount -o remount /home
    
    # Check if remount was successful
    if [ $? -eq 0 ]; then
        echo "Remount of /home partition with nodev option was successful."
    else
        echo "Remount of /home partition with nodev option failed."
    fi
else
    echo "No /home partition found in /etc/fstab."
fi
