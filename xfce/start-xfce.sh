#!/bin/bash
# Start XFCE4 desktop
termux-wake-lock
termux-x11 :0 -xstartup "dbus-launch --exit-with-session xfce4-session" &
proot-distro login debian -- bash -c "~/proot-scripts/start-proot.sh"
