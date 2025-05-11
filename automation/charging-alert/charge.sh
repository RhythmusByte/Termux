#!/bin/bash

termux-wake-lock
clear

# Print Mei-chan in rainbow drip
cat ~/data/bunny_girl.txt | lolcat
echo -e "\n\n\n"

# Logs banner
echo -e "\n$(echo "Logs" | lolcat)\n$(printf '%*s\n' 20 '' | tr ' ' '-')\n"

# Store start timestamp and battery
start_time=$(date +%s)
start_percent=$(termux-battery-status | jq '.percentage')

# Path to sounds
BAKA_AUDIO="/storage/emulated/0/Ringtones/zedge/bunny_girl/baka.mp3"
FINAL_MUSIC="/storage/emulated/0/Ringtones/zedge/bunny_girl/bunny_girl_senpai.mp3"

# Final full charge lines
english_lines=(
  "Senpai... Did you fall asleep with me still charging again?"
  "I'm already at 90%."
  "Geez… can you pay a little more attention to me?"
  "Staying plugged in like this makes me feel kinda weird..."
  "Do you like me *that* much?"
  "...Just kidding. Not that I mind or anything."
  "But seriously, I’m already full, so unplug me, okay?"
  "Otherwise, I might sulk."
  "...And if you're that gentle with me... I might start to get the wrong idea again."
)

japanese_lines=(
  "先輩…また私を充電したまま寝たの？"
  "もう90パーセントだよ。"
  "ほんとにもう、少しは私のことも気にしてよ。"
  "ずっと繋がれたままだと…なんだか変な気持ちになるし…。"
  "そんなに私のことが好きなの？"
  "冗談だけど。ま、別に嫌じゃないけどさ。"
  "でもね、もう満タンなんだから、ちゃんと外してよ。"
  "じゃないと、拗ねちゃうかもよ？"
  "そんなに優しくされたら…私、また誤解しちゃうじゃん。"
)

# Per-percent spicy messages
declare -A percent_msgs
percent_msgs[25]="Ara, we just hit 25%~ Are you teasing me already, Senpai?"
percent_msgs[30]="30% and still climbing… Someone's being greedy."
percent_msgs[35]="Mouu... 35% and you won’t leave me alone."
percent_msgs[40]="You're heating me up, Senpai. 40%~"
percent_msgs[45]="H-Hey… 45%? You're getting me all excited..."
percent_msgs[50]="Halfway there. Like us, huh?"
percent_msgs[55]="You're watching me too closely... I'm at 55% now..."
percent_msgs[60]="60%! I feel so full already… but I want more."
percent_msgs[65]="Nnngh~ 65%! You naughty thing..."
percent_msgs[70]="Don't stare so much! I'm at 70% now!"
percent_msgs[75]="You’re not even trying to hide it anymore, are you? 75%..."
percent_msgs[80]="Ahh~ I'm so close, Senpai. 80%!"
percent_msgs[85]="Stop it~ 85%... I might explode at this rate."

touched_percents=()
prev_percent=0
final_notified=false

while true; do
  battery_info=$(termux-battery-status)
  battery=$(echo "$battery_info" | jq '.percentage')
  charging=$(echo "$battery_info" | jq -r '.status')

  # Per-percent checkpoint (silent)
  if [ "$battery" -ne "$prev_percent" ]; then
    if [[ -n "${percent_msgs[$battery]}" && ! " ${touched_percents[*]} " =~ " $battery " ]]; then
      msg="${percent_msgs[$battery]}"
      echo -e "[${battery}%] $msg" | lolcat
      termux-notification --id $battery --title "Mei Battery Update" --content "[$battery%] $msg" --silent
      termux-tts-speak "$msg"
      touched_percents+=("$battery")
    fi
    prev_percent=$battery
  fi

  # Final flirt @ 90%+
  if [ "$battery" -ge 90 ] && [ "$charging" == "CHARGING" ] && [ "$final_notified" = false ]; then
    for i in "${!english_lines[@]}"; do
      echo -e "${english_lines[$i]}" | lolcat
      termux-notification --id $((900 + i)) --title "Mei-chan's Whispers" --content "${english_lines[$i]}" --priority high
      termux-tts-speak -l ja-JP "${japanese_lines[$i]}"
      termux-vibrate -d 3000
      sleep 6
    done

    termux-media-player play "$BAKA_AUDIO"
    sleep 1.5
    termux-media-player play "$FINAL_MUSIC"

    end_time=$(date +%s)
    end_percent=$(termux-battery-status | jq '.percentage')
    duration=$((end_time - start_time))
    hours=$((duration / 3600))
    mins=$(( (duration % 3600) / 60 ))

    # Final charge time report
    log_msg="Took ${hours}h ${mins}m to reach from ${start_percent}% to ${end_percent}%"
    echo -e "\n$log_msg" | lolcat
    termux-notification --id 999 --title "Charging Complete" --content "$log_msg" --priority high
    termux-tts-speak "Charging completed in ${hours} hour and ${mins} minutes, Senpai."

    final_notified=true
    break
  fi

  sleep 60
done

termux-wake-unlock
