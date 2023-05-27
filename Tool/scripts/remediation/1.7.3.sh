#!/bin/bash

# Print information about the current step
echo "Step 1: Editing /etc/issue.net"
echo "Authorized uses only. All activity may be monitored and reported." | sudo tee /etc/issue.net

# Print completion message
echo "Remediation steps completed successfully."
