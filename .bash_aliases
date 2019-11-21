alias .i='sudo pacman -Syu'
alias .u='sudo pacman -Syyuu'
alias .r='sudo pacman -Rns'
alias .clean='sudo pacman -Sc'
alias .info='pacman -Qi'
alias .p='DISPLAY=:0 xclip -o'
alias del='rm -rvf'
alias md='mkdir -p'
alias cat='bat'
alias ls='lsd'
alias ydl='youtube-dl'
alias udl='sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && sudo chmod a+rx /usr/local/bin/youtube-dl'
alias .mpv='mpv --msg-level=vd=debug'
alias pvpn='sudo pvpn'
alias fr='docker-compose -f /home/shscs911/Q/Dogma/Source/FR/docker-compose.yml up'
alias up='sudo systemctl start docker && docker-compose up'
alias down='docker-compose down && sudo systemctl stop docker'
alias .graph='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias glog="\git log --color --all --date-order --decorate --dirstat=lines,cumulative --stat | sed 's/\([0-9] file[s]\? .*)$\)/\1\n_______\n-------/g' | \less -R"










