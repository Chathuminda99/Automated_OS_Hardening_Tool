#!/bin/bash

# Create an encrypted password with grub-mkpasswd-pbkdf2
echo "Please enter the password you want to encrypt for GRUB:"
read -s password
encrypted_password=$(grub-mkpasswd-pbkdf2 <<< "$password")

# Add the superuser and encrypted password to a custom /etc/grub.d configuration file
echo "Please enter the username of the superuser for GRUB:"
read username
cat <<EOF > /etc/grub.d/99_custom
#!/bin/sh
cat <<END
set superusers="$username"
password_pbkdf2 $username $encrypted_password
END
EOF

# Make the custom file executable and update GRUB
chmod +x /etc/grub.d/99_custom
update-grub

echo "GRUB password configuration completed successfully."
