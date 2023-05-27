#!/bin/bash

# Print information about the current step
echo "Step 1: Setting permissions on /etc/issue"
sudo chown root:root $(readlink -e /etc/issue)
sudo chmod u-x,go-wx $(readlink -e /etc/issue)

# Print completion message
echo "Remediation steps completed successfully."
