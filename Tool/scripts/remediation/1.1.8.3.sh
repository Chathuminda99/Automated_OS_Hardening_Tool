#!/bin/bash

# Check if the /dev/shm partition exists in the fstab file
if grep -q "/dev/shm" /etc/fstab; then
  # Add nosuid to the fourth field (mounting options)
  sed -i 's/\(\/dev\/shm.*\)\(defaults\)\(.*\)/\1\2,nosuid\3/' /etc/fstab
  
  # Remount /dev/shm with the updated options
  mount -o remount /dev/shm
  
  # Print success message
  echo "Successfully added nosuid to /dev/shm in /etc/fstab and remounted it"
else
  # Print error message if /dev/shm is not found in fstab
  echo "Error: /dev/shm partition not found in /etc/fstab"
fi
