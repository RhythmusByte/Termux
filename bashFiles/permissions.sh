#!/data/data/com.termux/files/usr/bin/zsh

# Prompt for choice
echo -n "Do you wanna enter file name (y or n): "
read choice

echo " "

# Check condition and perform accordingly
if [ "$choice" = "n" ]; then
  chmod +x *
  echo "Permission given to all files"

elif [ "$choice" = "y" ]; then
  echo -n "Enter file name: "
  read fileName

  # Confirming it's a bash file
  case "$fileName" in
    *.sh) echo "$fileName is a bash file..."
      chmod +x "$fileName"
      echo "Permission given to $fileName"
    ;;
    *) echo "$fileName is not a bash file!!"
    ;;
  esac

else 
  echo "Invalid choice"
fi
