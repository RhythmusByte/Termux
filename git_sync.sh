#!/bin/zsh

git status 

printf "Wanna enter file names manually (y/n): "
read choice

if [ "$choice" = "y" ]; then
  printf "\nEnter the filenames: "
  read filename
  git add "$filename" 
  printf "Successfully added %s\n" "$filename"
else
  git add .
fi

git status

printf "\nDo you wanna remove any file from staging? (y/n): "
read unsetChoice

if [ "$unsetChoice" = "y" ]; then
  printf "\nEnter file names to remove: "
  read unsetFilenames
  git reset "$unsetFilenames"
  git status
fi

read 'msg?Enter a commit message (leave blank to use Minor Changes): '
msg="${msg:-Minor Changes}"
git commit -m "$msg"

echo "Successfully committed $msg!!"

git status

printf "Wanna push changes? (y/n): "
read push_choice

if [ "$push_choice" = "y" ]; then
  read 'branch?Enter a branch name (leave blank to use main): '
  branch="${branch:-main}"
  git push origin "$branch"
fi

echo -e "Completed all processes\n\nClearing Screen..."
clear
