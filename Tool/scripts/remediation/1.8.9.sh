#!/usr/bin/env bash

{
    # Check if GNOME Desktop Manager is installed. If the package isn't installed, the recommendation is Not Applicable
    l_pkgoutput=""
    if command -v dpkg-query > /dev/null 2>&1; then
        l_pq="dpkg-query -W"
    elif command -v rpm > /dev/null 2>&1; then
        l_pq="rpm -q"
    fi

    # Check if GDM is installed
    l_pcl="gdm gdm3" # Space-separated list of packages to check
    for l_pn in $l_pcl; do
        $l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="y" && echo -e "\n - Package: \"$l_pn\" exists on the system\n - remediating configuration if needed"
    done

    # Check configuration (If applicable)
    if [ -n "$l_pkgoutput" ]; then
        # Look for autorun to determine the profile in use, needed for remaining tests
        l_kfd="/etc/dconf/db/$(grep -Psril '^\h*autorun-never\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}').d" # set directory of the key file to be locked
        if [ -d "$l_kfd" ]; then
            # If the key file directory doesn't exist, options can't be locked
            if grep -Priq '^\h*\/org/gnome\/desktop\/media-handling\/autorun-never\b' "$l_kfd"; then
                echo " - \"autorun-never\" is locked in \"$(grep -Pril '^\h*\/org/gnome\/desktop\/media-handling\/autorun-never\b' "$l_kfd")\""
            else
                echo " - creating entry to lock \"autorun-never\""
                [ ! -d "$l_kfd"/locks ] && echo "creating directory $l_kfd/locks" && mkdir "$l_kfd"/locks
                {
                    echo -e '\n# Lock desktop media-handling autorun-never setting'
                    echo '/org/gnome/desktop/media-handling/autorun-never'
                } >> "$l_kfd"/locks/00-media-autorun
            fi
        else
            echo -e " - \"autorun-never\" is not set so it cannot be locked\n - Please follow the recommendation \"Ensure GDM autorun-never is enabled\" and run this script again"
        fi
        # Update dconf database
        dconf update
    else
        echo -e " - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
    fi
}
