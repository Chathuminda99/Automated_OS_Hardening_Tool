#!/bin/bash

if grep -qs '/var/log/audit' /proc/mounts; then
    if grep -qs '/var/log/audit' /etc/fstab; then
        sed -i '/\/var\/log\/audit/s/^\(\S*\s\+\S*\s\+\S*\s\+\)\(\S*\)/\1\2,nodev/' /etc/fstab
        mount -o remount /var/log/audit
        if [ $? -eq 0 ]; then
            echo "Success: /var/log/audit remounted with nodev option"
        else
            echo "Error: Failed to remount /var/log/audit with nodev option"
        fi
    else
        echo "Error: /var/log/audit not found in /etc/fstab"
    fi
else
    echo "Error: /var/log/audit partition not found"
fi
