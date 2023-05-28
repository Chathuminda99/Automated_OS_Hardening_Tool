#!/bin/bash

# Function to edit chrony.conf or a .conf file
edit_chrony_config() {
    local config_file="$1"
    local config_content="$2"
    echo "$config_content" | sudo tee "$config_file" >/dev/null
}

# Function to remove chrony from the system
remove_chrony() {
    sudo apt-get purge -y chrony
}

# Edit chrony configuration
chrony_config="/etc/chrony/chrony.conf"  # Modify this if using a different file
config_content=$(cat <<EOF
# Add or edit the user line below as appropriate
user _chrony
EOF
)

edit_chrony_config "$chrony_config" "$config_content"

echo "Chrony configuration completed."

# Prompt for removing chrony if another time synchronization service is in use
read -p "Do you want to remove chrony from the system (if not in use)? (y/n): " remove_chrony
if [[ "$remove_chrony" == "y" ]]; then
    remove_chrony
    echo "Chrony has been removed from the system."
fi
