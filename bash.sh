#!/bin/bash

# NOTE: Be sure to run this script with `sudo`.

# Read user and password
iuser="myftp"
ipasswd="ftp123"
# Just print this for debugging.
printf "\tCreating user: %s with password: %s\n" $iuser $ipasswd

# Create the user with adduser (you can add whichever option you like).
useradd -m -s /bin/false $iuser

# Assign the password to the user.
# Password is passed via stdin, *twice* (for confirmation).
# ./password.xd

