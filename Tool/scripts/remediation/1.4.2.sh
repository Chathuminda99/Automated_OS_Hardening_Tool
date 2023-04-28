#!/bin/bash

# Prompt the user to proceed
read -p "This script will set permissions on your grub configuration. Do you want to proceed? (yes/no) " choice

# Check the user's response
if [[ $choice == "yes" ]]; then
    # Set permissions on the grub configuration
    sudo chown root:root /boot/grub/grub.cfg
    sudo chmod u-wx,go-rwx /boot/grub/grub.cfg
    echo "Grub configuration permissions have been set successfully."
else
    echo "Skipping grub configuration permissions setup."
fi
