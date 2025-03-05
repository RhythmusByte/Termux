#!/bin/zsh

printf "Paste the magnet link: "
read link

printf "Enter destination directory: "
read destination

aria2c -d "$destination" "$link"

latest=$(ls -t "$destination" | head -n 1)
echo "Successfully downloaded file: $latest"
