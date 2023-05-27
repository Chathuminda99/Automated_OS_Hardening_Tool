#!/bin/bash

# Print information about the current step
echo "Step 1: Editing /etc/default/apport"
sudo sed -i 's/^enabled=.*/enabled=0/' /etc/default/apport

# Print information about the current step
echo "Step 2: Stopping the apport service"
sudo systemctl stop apport.service

# Print information about the current step
echo "Step 3: Disabling the apport service"
sudo systemctl --now disable apport.service

# Print completion message
echo "Remediation steps completed successfully."
