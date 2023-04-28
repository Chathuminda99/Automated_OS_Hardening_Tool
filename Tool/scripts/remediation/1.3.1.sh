#!/bin/bash

# Install AIDE using apt package manager
apt install aide aide-common

# Edit the AIDE configuration file as needed
# The configuration file is usually located at /etc/aide/aide.conf

# Initialize AIDE database
aideinit

# Rename the newly created AIDE database file
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db

# Print success message
echo "AIDE installation and initialization complete"
