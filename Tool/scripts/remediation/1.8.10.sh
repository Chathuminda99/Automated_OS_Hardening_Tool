#!/usr/bin/env bash

# Check if GNOME Desktop Manager is installed
if command -v dpkg-query > /dev/null 2>&1; then
    l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
    l_pq="rpm -q"
fi

# Check if GDM is installed
l_pcl="gdm gdm3" # Space-separated list of packages to check
for l_pn in $l_pcl; do
    $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="y"
done

if [ -n "$l_pkgoutput" ]; then
    # Check if custom.conf file exists
    if [ -f "/etc/gdm3/custom.conf" ]; then
        # Remove the line "Enable=true" from the custom.conf file
        sed -i '/^Enable=true$/d' /etc/gdm3/custom.conf
        echo "Line 'Enable=true' removed from /etc/gdm3/custom.conf"
    else
        echo "File /etc/gdm3/custom.conf not found"
    fi
else
    echo "GNOME Desktop Manager package is not installed on the system"
fi
