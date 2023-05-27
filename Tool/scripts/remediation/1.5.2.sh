#!/bin/bash

# Print information about the current step
echo "Step 1: Restoring binaries to normal"
sudo prelink -ua

# Check if prelink is installed
if [ -x "$(command -v prelink)" ]; then
  # Print information about the current step
  echo "Step 2: Uninstalling prelink"
  
  # Check the package manager
  if [ -x "$(command -v apt)" ]; then
    # Using apt package manager (Debian-based systems)
    sudo apt purge prelink
  elif [ -x "$(command -v yum)" ]; then
    # Using yum package manager (Red Hat-based systems)
    sudo yum remove prelink
  elif [ -x "$(command -v dnf)" ]; then
    # Using dnf package manager (Fedora)
    sudo dnf remove prelink
  else
    # Unsupported package manager
    echo "Error: Unable to determine the package manager to uninstall prelink."
    exit 1
  fi
else
  echo "Prelink is not installed. Skipping uninstallation."
fi

# Print completion message
echo "Restoration steps completed successfully."
