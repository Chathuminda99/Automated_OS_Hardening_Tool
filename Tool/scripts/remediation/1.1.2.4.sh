#!/usr/bin/env bash

# Add nosuid to the fourth field of the /tmp partition in /etc/fstab
sed -i 's/\b\(\/tmp\s.*\)/\1,nosuid/' /etc/fstab

# Remount the /tmp partition with the new options
mount -o remount /tmp
