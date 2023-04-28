#!/bin/bash

# Check if /var/tmp partition exists
if grep -q "/var/tmp" /etc/fstab; then
  # Edit /etc/fstab and add nosuid to the fourth field
  sed -i 's/^\(\S*\s*\/var\/tmp\s*\S*\s*\)[^ ]*/\1defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
  
  # Remount /var/tmp with the new configuration
  mount -o remount /var/tmp
fi
