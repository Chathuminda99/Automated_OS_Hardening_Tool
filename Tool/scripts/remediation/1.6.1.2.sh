#!/bin/bash

# Print information about the current step
echo "Step 1: Editing /etc/default/grub"
sudo sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"/' /etc/default/grub

# Print information about the current step
echo "Step 2: Updating the grub2 configuration"
sudo update-grub

# Print completion message
echo "Remediation steps completed successfully."
