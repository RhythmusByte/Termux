#!/bin/zsh

echo "Updating Termux"

apt update -y 
apt full-upgrade -y
pkg install termux-tools
apt autoremove -y && apt autoclean
clear

echo "Terminal Updated Successfully"
