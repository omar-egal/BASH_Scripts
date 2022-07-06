#!/bin/bash


echo "Please enter a new user(s): "

read -a users

wait
read -s -p "Please enter password: " password
echo
for user in ${users[@]}; do
        if id -u $user > /dev/null 2>&1; then
                echo "The username $user is already taken, please enter a different username"

        else
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
                sudo useradd -m -p "$pass" "$user"
                [ $? -eq 0 ] && echo "$user was successfully added."
        fi
done
