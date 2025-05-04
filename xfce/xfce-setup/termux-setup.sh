#!/bin/bash
# Termux initial setup
pkg update -y
pkg upgrade -y
pkg install -y x11-repo proot-distro termux-x11-nightly wget

# Create script directory
mkdir -p ~/proot-scripts

# Download proot-setup.sh
wget -O ~/proot-scripts/proot-setup.sh https://raw.githubusercontent.com/yourusername/termux-xfce4-setup/main/proot-setup.sh
chmod +x ~/proot-scripts/proot-setup.sh

# Install Debian and setup XFCE4
proot-distro install debian
proot-distro login debian -- ~/proot-scripts/proot-setup.sh

echo "Install Termux-X11 APK manually from:"
echo "https://github.com/termux/termux-x11/releases"
