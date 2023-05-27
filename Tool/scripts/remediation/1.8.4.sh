#!/usr/bin/env bash
{
    NAME_OF_DCONF_DATABASE="local"
    FILE_NAME="00-screensaver"
    l_key_file="/etc/dconf/db/$NAME_OF_DCONF_DATABASE.d/$FILE_NAME"
    l_idmv="900" # Set max value for idle-delay in seconds (between 1 and 900)
    l_ldmv="5" # Set max value for lock-delay in seconds (between 0 and 5)

    # Create or edit the profile file
    echo -e "\nuser-db:user\nsystem-db:$NAME_OF_DCONF_DATABASE" >> /etc/dconf/profile/user

    # Create the database directory if it doesn't exist
    mkdir -p /etc/dconf/db/$NAME_OF_DCONF_DATABASE.d/

    # Create or edit the key file
    {
        echo '# Specify the dconf path'
        echo '[org/gnome/desktop/session]'
        echo ''
        echo '# Number of seconds of inactivity before the screen goes blank'
        echo '# Set to 0 seconds if you want to deactivate the screensaver.'
        echo "idle-delay=uint32 $l_idmv"
        echo ''
        echo '# Specify the dconf path'
        echo '[org/gnome/desktop/screensaver]'
        echo ''
        echo '# Number of seconds after the screen is blank before locking the screen'
        echo "lock-delay=uint32 $l_ldmv"
    } > "$l_key_file"

    # Update the system databases
    dconf update
}
