#!/bin/bash
# Debian proot setup
apt update && apt upgrade -y
apt install -y xfce4 xfce4-terminal dbus-x11 elogind firefox-esr

# Configure services
mkdir -p /var/run/dbus /var/run/elogind
echo "sudo dbus-daemon --system --fork" >> ~/.bashrc
echo "sudo /lib/elogind/elogind --daemon" >> ~/.bashrc

# Disable compositing
xfconf-query -c xfwm4 -p /general/use_compositing -s false

# Create control scripts
cat > ~/start-xfce.sh <<'EOF'
#!/bin/bash
termux-x11 :0 -xstartup "dbus-launch --exit-with-session xfce4-session"
EOF

cat > ~/stop-xfce.sh <<'EOF'
#!/bin/bash
pkill -f termux-x11
sudo pkill elogind
sudo pkill dbus-daemon
EOF

chmod +x ~/start-xfce.sh ~/stop-xfce.sh
