#!/bin/bash

# MySQL credentials
MYSQL_USER="root"
MYSQL_PASS="pwd"
MYSQL_DB="anime_manga"

# Function to insert anime data
add_anime() {
    read -p "Enter Anime Title: " title
    read -p "Enter Status (Completed, Watching, Planned, On Hold): " status
    read -p "Enter Rating (0-10): " score
    read -p "Enter Episodes Watched: " episodes

    mysql -u $MYSQL_USER -p$MYSQL_PASS $MYSQL_DB -e "INSERT INTO anime (title, status, score, episodes) VALUES ('$title', '$status', $score, $episodes);"
    echo "Anime added successfully!"
}

# Function to insert manga data
add_manga() {
    read -p "Enter Manga Title: " title
    read -p "Enter Status (Completed, Reading, Planned, On Hold): " status
    read -p "Enter Rating (0-10): " score
    read -p "Enter Chapters Read: " chapters

    mysql -u $MYSQL_USER -p$MYSQL_PASS $MYSQL_DB -e "INSERT INTO manga (title, status, score, chapters) VALUES ('$title', '$status', $score, $chapters);"
    echo "Manga added successfully!"
}

# Display options
echo "1. Add Anime"
echo "2. Add Manga"
echo "3. Exit"
read -p "Choose an option: " choice

case $choice in
    1) add_anime ;;
    2) add_manga ;;
    3) exit 0 ;;
    *) echo "Invalid option";;
esac
