#!/usr/bin/env bash

# Function to remediate time synchronization using chrony
function remediate_chrony() {
    # Install chrony
    apt install -y chrony

    # Stop and mask systemd-timesyncd
    systemctl stop systemd-timesyncd.service
    systemctl --now mask systemd-timesyncd.service

    # Remove the ntp package
    apt purge -y ntp

    echo "Time synchronization remediated successfully using chrony."
}

# Function to remediate time synchronization using systemd-timesyncd
function remediate_systemd_timesyncd() {
    # Remove the chrony package
    apt purge -y chrony

    # Remove the ntp package
    apt purge -y ntp

    echo "Time synchronization remediated successfully using systemd-timesyncd."
}

# Function to remediate time synchronization using ntp
function remediate_ntp() {
    # Install ntp
    apt install -y ntp

    # Stop and mask systemd-timesyncd
    systemctl stop systemd-timesyncd.service
    systemctl --now mask systemd-timesyncd.service

    # Remove the chrony package
    apt purge -y chrony

    echo "Time synchronization remediated successfully using ntp."
}

# Main script
echo "Select a time synchronization daemon:"
echo "1. chrony"
echo "2. systemd-timesyncd"
echo "3. ntp"
read -p "Enter your choice (1-3): " choice

case $choice in
    1)
        remediate_chrony
        ;;
    2)
        remediate_systemd_timesyncd
        ;;
    3)
        remediate_ntp
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
