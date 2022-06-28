#!/bin/bash

echo -n "Please enter the username: "

read user
if id -u $user > /dev/null 2>&1; then
        echo "This username already taken, please enter a different username"
else
        sudo useradd -m $user
        echo
        echo "The user was successfully added, here is list of all current users: "
        awk -F: '{print $1}' /etc/passwd

fi

