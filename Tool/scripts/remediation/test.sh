#!/bin/bash

# Add the nodev option to the /tmp partition in /etc/fstab
sudo sed -i 's/\(.*\) \/tmp\(.*\)/\1 \/tmp\2,nodev/' /etc/fstab

# Remount the /tmp partition with the new options
sudo mount -o remount /tmp

# Verify that the /tmp partition is mounted with the new options
mount | grep /tmp
