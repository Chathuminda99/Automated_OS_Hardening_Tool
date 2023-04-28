#!/bin/bash

if grep -q "/var/log" /etc/fstab; then
  sed -i 's|\(^.* /var/log .* $\)|\1,nodev|g' /etc/fstab
  mount -o remount /var/log
  echo "Remediation successful"
else
  echo "The /var/log partition does not exist"
fi
