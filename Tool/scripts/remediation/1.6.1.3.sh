#!/bin/bash

# Print information about the current step
echo "Step 1: Setting all AppArmor profiles to enforce mode"
sudo aa-enforce /etc/apparmor.d/*

# Print completion message
echo "Remediation steps completed successfully."
