#!/bin/bash

# Print information about the current step
echo "Step 1: Adding line to /etc/security/limits.conf or a /etc/security/limits.d/* file"
echo "* hard core 0" | sudo tee -a /etc/security/limits.conf

# Print information about the current step
echo "Step 2: Setting parameter in /etc/sysctl.conf or a /etc/sysctl.d/* file"
echo "fs.suid_dumpable = 0" | sudo tee -a /etc/sysctl.conf

# Print information about the current step
echo "Step 3: Setting active kernel parameter"
sudo sysctl -w fs.suid_dumpable=0

# Check if systemd-coredump is installed
if [ -x "$(command -v systemd-coredump)" ]; then
  # Print information about the current step
  echo "Step 4: Editing /etc/systemd/coredump.conf"
  echo "Storage=none" | sudo tee -a /etc/systemd/coredump.conf
  echo "ProcessSizeMax=0" | sudo tee -a /etc/systemd/coredump.conf

  # Print information about the current step
  echo "Step 5: Reloading systemd daemon"
  sudo systemctl daemon-reload
fi

# Print completion message
echo "Remediation steps completed successfully."
