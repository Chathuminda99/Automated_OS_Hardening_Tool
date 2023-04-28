#!/bin/bash

# Check if /var/log/audit partition exists
if [ -d "/var/log/audit" ]; then
    # Edit /etc/fstab to add noexec to the fourth field for /var/log/audit partition
    sed -i '/\/var\/log\/audit/s/defaults/defaults,noexec/' /etc/fstab
    
    if [ $? -eq 0 ]; then
        echo "Successfully added noexec to the /var/log/audit partition in /etc/fstab."
    else
        echo "Failed to add noexec to the /var/log/audit partition in /etc/fstab."
        exit 1
    fi
    
    # Remount /var/log/audit partition with the configured options
    mount -o remount /var/log/audit
    
    if [ $? -eq 0 ]; then
        echo "Successfully remounted /var/log/audit partition with the configured options."
    else
        echo "Failed to remount /var/log/audit partition with the configured options."
        exit 1
    fi
    
else
    echo "/var/log/audit partition does not exist."
    exit 1
fi
