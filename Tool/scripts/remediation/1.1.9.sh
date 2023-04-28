#!/bin/bash

# Check if autofs package is installed
if dpkg -l | grep -q autofs; then
  # Check if any packages depend on autofs
  if apt-cache rdepends autofs | grep -q "^ "; then
    # If there are dependencies, mask the autofs service
    systemctl stop autofs
    systemctl mask autofs
    echo "autofs service masked successfully"
  else
    # If there are no dependencies, remove the autofs package
    apt purge autofs
    echo "autofs package removed successfully"
  fi
else
  echo "autofs package is not installed"
fi
