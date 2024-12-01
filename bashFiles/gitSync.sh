#!/bin/bash

user=$(git config user.name)
echo "Current User: $user"

echo "Enter Commit Message (or press Enter for 'Quick Update'):"
read msg

msg=${msg:-"Quick Update"}

echo " "

echo "Working... 😏"
git status
git add .
git commit -m "$msg"
git push origin main

echo " "

echo "✨ All done, $msg has been pushed!"
