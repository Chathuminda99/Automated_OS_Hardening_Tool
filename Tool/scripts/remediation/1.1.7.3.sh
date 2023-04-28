#!/bin/bash

if grep -q '/home' /etc/fstab; then
  sudo sed -i 's/\(^.*\/home.*defaults.*$\)/\1,nosuid/' /etc/fstab
  sudo mount -o remount /home
  echo "Remediation successful"
else
  echo "/home partition not found in /etc/fstab"
  echo "Remediation unsuccessful"
fi
