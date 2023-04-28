#!/bin/bash

if grep -q "/dev/shm" /etc/fstab; then
  sed -i '/\/dev\/shm/s/defaults/&,noexec/' /etc/fstab
  mount -o remount /dev/shm
  echo "Successfully added noexec option to /dev/shm and remounted it."
else
  echo "/dev/shm partition does not exist in /etc/fstab."
fi
