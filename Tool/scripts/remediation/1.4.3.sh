#!/bin/bash

# Prompt the user about the risk and ask for confirmation
read -p "Setting a password for the root user can be a security risk. Do you want to proceed? (y/n) " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    # Run the command to set the password for the root user
    passwd root
else
    echo "No action taken."
fi
