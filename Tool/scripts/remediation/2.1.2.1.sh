#!/bin/bash

# Function to edit chrony.conf or a .sources file
edit_chrony_config() {
    local config_file="$1"
    local config_content="$2"
    echo "$config_content" | sudo tee "$config_file" >/dev/null
}

# Function to restart chronyd
restart_chronyd() {
    sudo systemctl restart chronyd
}

# Function to reload chrony sources from a .sources file
reload_chrony_sources() {
    sudo chronyc reload sources
}

# Install chrony if not already installed
sudo apt-get update
sudo apt-get install -y chrony

# Edit chrony configuration
chrony_config="/etc/chrony/chrony.conf"  # Modify this if using a different file
config_content=$(cat <<EOF
# Add or edit the server or pool lines below according to your local site policy
server time.nist.gov iburst
server time-a-g.nist.gov iburst
server 132.163.97.3 iburst
server time-d-b.nist.gov iburst
EOF
)

edit_chrony_config "$chrony_config" "$config_content"

# Restart or reload chrony based on the configuration file
if [[ "$chrony_config" == *".sources" ]]; then
    reload_chrony_sources
else
    restart_chronyd
fi

echo "Chrony configuration completed."

# Prompt for removing chrony if another time synchronization service is in use
read -p "Do you want to remove chrony from the system (if not in use)? (y/n): " remove_chrony
if [[ "$remove_chrony" == "y" ]]; then
    sudo apt-get purge -y chrony
    echo "Chrony has been removed from the system."
fi

