#!/bin/bash

# Check if /var/tmp partition exists
if grep -q '/var/tmp' /etc/fstab; then
    # If it exists, add noexec to the mounting options in /etc/fstab
    sed -i 's/\(.*\/var\/tmp.*\)/\1,noexec/' /etc/fstab
    # Remount /var/tmp with the new options
    mount -o remount /var/tmp
fi
