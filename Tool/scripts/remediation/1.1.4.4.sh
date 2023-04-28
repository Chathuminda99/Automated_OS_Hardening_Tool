#!/bin/bash

# Check if /var/tmp partition exists
if [[ $(grep -w '/var/tmp' /etc/fstab) ]]; then
    # Edit /etc/fstab and add "nodev" to the fourth field for /var/tmp partition
    sed -i.bak '/\/var\/tmp/ s/defaults/defaults,nodev/' /etc/fstab

    # Remount /var/tmp partition with the new configuration
    mount -o remount /var/tmp
fi
