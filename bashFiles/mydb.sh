#!/data/data/com.termux/files/usr/bin/zsh

# Get the current username
USER=$(whoami)

# Define the data directory and socket path
DATADIR=$PREFIX/var/lib/mysql
SOCKET=/data/data/com.termux/files/usr/var/run/mysqld.sock

# Check if MariaDB server is running
if ! pgrep -x "mysqld" > /dev/null; then
    echo "Starting MariaDB server..."
    
    # Create the socket directory if it doesn't exist
    mkdir -p /data/data/com.termux/files/usr/var/run/

    # Start the MariaDB server
    mysqld_safe --datadir=$DATADIR &
    sleep 5  # Allow some time for the server to start
else
    echo "MariaDB server is already running."
fi

# Connect to MariaDB with the current username
echo "Connecting to MariaDB as user: $USER"
mariadb -u $USER --socket=$SOCKET
