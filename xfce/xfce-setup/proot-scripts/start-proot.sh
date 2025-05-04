#!/bin/bash
# Start DBus/elogind and disable compositing
sudo mkdir -p /var/run/dbus /var/run/elogind
sudo dbus-daemon --system --fork
sudo /lib/elogind/elogind --daemon
xfconf-query -c xfwm4 -p /general/use_compositing -s false
