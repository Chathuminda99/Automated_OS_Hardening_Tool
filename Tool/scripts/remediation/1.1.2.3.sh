#!/usr/bin/env bash

# Edit /etc/fstab to add noexec to the /tmp partition
sed -i 's/\(^.* \/tmp .*\)$/\1,noexec/' /etc/fstab

# Remount the /tmp partition with the new options
mount -o remount /tmp
