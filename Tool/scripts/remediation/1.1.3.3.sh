#!/bin/bash

# Add nosuid to the /var partition in /etc/fstab
sed -i '/\/var/s/defaults/&,nosuid/' /etc/fstab

# Remount the /var partition with the new configuration
mount -o remount /var
