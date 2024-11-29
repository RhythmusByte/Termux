#!/data/data/com.termux/files/usr/bin/zsh

name="Akhil"
userName="rhythmusbyte"
up=$(uptime -p)
today=$(date +%d-%m-%Y)

cat << EOF
|---------------------------|
|-       Hello $name       -|
|-   Welcome to Termux :)  -|
|---------------------------|

Today: $today
Up: $up
EOF
echo " "
