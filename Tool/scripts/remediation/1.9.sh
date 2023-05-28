#!/usr/bin/env bash

# Check if the apt command is available
if command -v apt >/dev/null 2>&1; then
    # Run the apt upgrade command
    apt upgrade -y
    echo "Packages updated successfully."
else
    echo "apt command not found. Make sure you are running this script on a system that uses apt as the package manager."
fi
