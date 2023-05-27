#!/bin/bash

# Print information about the current step
echo "Step 1: Adding parameter to /etc/sysctl.conf or a /etc/sysctl.d/* file"
echo "kernel.randomize_va_space = 2" | sudo tee -a /etc/sysctl.d/60-kernel_sysctl.conf

# Print information about the current step
echo "Step 2: Setting active kernel parameter"
sudo sysctl -w kernel.randomize_va_space=2

# Print completion message
echo "Remediation steps completed successfully."
