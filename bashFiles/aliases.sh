#!/data/data/com.termux/files/usr/bin/zsh

# Aliases
alias cl='bash ~/scripts/clear.sh'
alias ex='exit'
alias upd='apt update && apt upgrade -y'
alias pku='pkg update && pkg upgrade -y'
alias ga='git add .'
alias gs='git status'
alias gc='git commit -m "File Updated"'
alias gp='git push origin main'
alias ls=lsd
alias nv=nvim
alias cpy=termux-clipboard-set
alias gl='git log --oneline --graph --decorate --all'
alias weather='curl wttr.in'
alias ping='ping -c 5 stackoverflow.com'
alias cat='bat --paging=never'
alias open='termux-open'
alias gg='bash ~/scripts/gitSync.sh'
alias ..='cd ..'            
alias ...='cd ../..'      
alias ~='cd ~'             
alias dl='cd ~/downloads'   
alias db='mysql -u root -p'
alias mdb='mariadb -u root -p'
