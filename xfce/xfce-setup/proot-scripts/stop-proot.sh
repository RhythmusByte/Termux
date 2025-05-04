#!/bin/bash
# Kill lingering processes
sudo pkill -9 elogind
sudo pkill -9 dbus-daemon
pkill -9 xfce4-session
rm -f /var/run/dbus/pid /var/run/elogind.pid
