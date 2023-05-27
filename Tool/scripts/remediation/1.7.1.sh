#!/bin/bash

# Print information about the current step
echo "Step 1: Editing /etc/motd"
sudo sed -i 's/\\[mrs]\|\\v\|\(references to OS platform\)//g' /etc/motd

# Check if the motd file exists
if [ -f /etc/motd ]; then
  # Print information about the current step
  echo "Step 2: Removing the motd file"
  sudo rm /etc/motd
else
  echo "The motd file does not exist. Skipping removal."
fi

# Print completion message
echo "Remediation steps completed successfully."
