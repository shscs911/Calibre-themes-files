# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/shscs911/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions common-aliases z fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias .i='sudo pacman -S'
alias .u='sudo pacman -Syu'
alias .r='sudo pacman -Rns'
alias .clean='sudo pacman -Scc'
alias .info='pacman -Qi'
alias del='rm -rvf'
alias md='mkdir -p'
alias cat='bat'
alias ls='lsd'
alias cp='cp -Rvf --preserve=timestamps'
alias fd='fd -a'
alias yay='yay --aur'
alias rsync='rsync -rht --info=progress2'
alias ydl='youtube-dl'
alias udl='sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && sudo chmod a+rx /usr/local/bin/youtube-dl'
alias gdl='gallery-dl'
alias speed='speed-test'
alias .mpv='mpv --msg-level=vd=debug'
alias serve='npx serve -n -u --no-etag /home/shscs911/Q/'
alias pvpn='sudo pvpn'
alias fr='docker-compose -f /home/shscs911/Q/Dogma/Source/FR/docker-compose.yml up'
alias up='sudo systemctl start docker && docker-compose up'
alias down='docker-compose down && sudo systemctl stop docker'
alias sd='sudo systemctl start docker'
alias ld='lazydocker'
alias mega='/home/shscs911/Q/Dogma/Source/Mega/MegaBasterdLinux_6.69.run'
alias psmax='ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'
alias .graph='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias glog="git log --color --all --date-order --decorate --dirstat=lines,cumulative --stat | sed 's/\([0-9] file[s]\? .*)$\)/\1\n_______\n-------/g' | \less -R"

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time root_indicator background_jobs)

POWERLEVEL9K_MODE=nerdfont-complete
#POWERLEVEL9K_HOME_ICON=$'\uE617'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='blue'
POWERLEVEL9K_DIR_ETC_BACKGROUND='blue'
POWERLEVEL9K_TIME_BACKGROUND='blue'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'

# Tilix VTE Issue
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Path

# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

export EDITOR=/usr/bin/micro
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.local/bin:$PATH
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
#export GOPATH=~/go
export DOWNGRADE_FROM_ALA=1
export TERM=xterm-256color
export MICRO_TRUECOLOR=1
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

##  fzf
# export FZF_CTRL_T_COMMAND="find -not -path '*/\.git/*' -not -path '*/\node_modules/*'"
# export FZF_DEFAULT_COMMAND="find -not -path '*/\.git/*' -not -path '*/\node_modules/*'"
export FZF_CTRL_T_OPTS="--preview 'if file -i {}|grep -q binary; then file -b {}; else bat --color \"always\" --line-range :40 {}; fi'"

## z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

transfer() {
    if [ $# -eq 0 ]; then
        echo -e "No arguments specified. Usage:\n echo transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi
    tmpfile=$(mktemp -t transferXXX)
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >>$tmpfile
    else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >>$tmpfile; fi
    cat $tmpfile
    rm -f $tmpfile
}

source /home/shscs911/.config/broot/launcher/bash/br