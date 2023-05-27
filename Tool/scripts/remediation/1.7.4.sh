#!/bin/bash

# Print information about the current step
echo "Step 1: Setting permissions on /etc/motd"
sudo chown root:root $(readlink -e /etc/motd)
sudo chmod u-x,go-wx $(readlink -e /etc/motd)

# Print completion message
echo "Remediation steps completed successfully."
