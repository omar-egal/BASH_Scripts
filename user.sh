#!/bin/bash


echo "Please enter a new user(s): "

read -a users

for user in ${users[@]}; do
        if id -u $user > /dev/null 2>&1; then
                echo "The username $user is already taken, please enter a different username"

        else
                sudo useradd -m "$user"
                [ $? -eq 0 ] && echo "$user was successfully added."
        fi
done

