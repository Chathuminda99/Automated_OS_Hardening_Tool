#!/bin/bash

# Create or edit aidecheck.service
cat << EOF > /etc/systemd/system/aidecheck.service
[Unit]
Description=Aide Check

[Service]
Type=simple
ExecStart=/usr/bin/aide.wrapper --config /etc/aide/aide.conf --check

[Install]
WantedBy=multi-user.target
EOF

# Create or edit aidecheck.timer
cat << EOF > /etc/systemd/system/aidecheck.timer
[Unit]
Description=Aide check every day at 5AM

[Timer]
OnCalendar=*-*-* 05:00:00
Unit=aidecheck.service

[Install]
WantedBy=multi-user.target
EOF

# Set ownership and permissions
chown root:root /etc/systemd/system/aidecheck.*
chmod 0644 /etc/systemd/system/aidecheck.*

# Reload systemd and enable services
systemctl daemon-reload
systemctl enable aidecheck.service
systemctl --now enable aidecheck.timer

echo "AIDE check scheduled with systemd timer and service."
