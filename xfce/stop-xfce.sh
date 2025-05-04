#!/bin/bash
# Kill all XFCE4 processes
termux-wake-unlock
pkill -f "termux-x11 :0"
proot-distro login debian -- bash -c "~/proot-scripts/stop-proot.sh"
