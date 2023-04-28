#!/usr/bin/env bash

# Add the tmpfs entry to /etc/fstab
echo "tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime,size=2G 0 0" | sudo tee -a /etc/fstab

# Reload the systemd configuration
sudo systemctl daemon-reload

# Mount the /tmp directory with the new configuration
sudo mount /tmp

# Verify that the /tmp directory is mounted with the new configuration
df -h /tmp

# Create a tmp.mount unit file with the necessary configuration
echo "[Unit]
Description=Temporary Directory /tmp
ConditionPathIsSymbolicLink=!/tmp
DefaultDependencies=no
Conflicts=umount.target
Before=local-fs.target umount.target
After=swap.target

[Mount]
What=tmpfs
Where=/tmp
Type=tmpfs" | sudo tee /etc/systemd/system/tmp.mount

# Reload the systemd configuration
sudo systemctl daemon-reload

# Enable the tmp.mount unit to start at boot time
sudo systemctl enable tmp.mount

# Start the tmp.mount unit to mount the /tmp directory with the new configuration
sudo systemctl start tmp.mount

# Verify that the /tmp directory is mounted with the new configuration
df -h /tmp
