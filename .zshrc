 # Created by newuser for 5.8

# Enable colors and change prompt:
export TERM="xterm-256color"
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


PS1="%{$fg[white]%}[%{$fg[white]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[white]%}%~%{$fg[white]%}]%{$reset_color%}$%b "
#PS1="%B%{$fg[white]%}[%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[cyan]%}%M %{$fg[white]%}%~%{$fg[white]%}]%{$reset_color%}$%b "

EDITOR=nvim

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

### ALIASES ###
alias dotfile='/usr/bin/git --git-dir=$HOME/dottofairu/ --work-tree=$HOME'
#alias ll='ls -lah'
alias cc='curl rate.sx'
alias temp='watch -n 2 sensors'
alias nwspeed='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias forecast='curl wttr.in'
alias nasty='smbclient //192.168.1.238/nasty -U scxrpion'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

### Input Keys ###

export SDL_IM_MODULE='fctix'
export XMODIFIERS='@im=fcitx'
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export QT5_IM_MODULE='fcitx'
export QT_QPA_PLATFORMTHEME='qt5ct'

# Load ; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

export base=~/Documents/notes
export noteExt=wiki
# This would be used for markdown
# export noteExt=md
note() {
  if [ ! -d $base ]; then
    mkdir -p $base
  fi
  # If note not specified, open most recent
  if [[ -z "$1" ]]; then
    nvim $(ls -t $(find $base/ -type f) | head -n 1)
  else
    nvim $base/$1.md
  fi
}

mknote() {
    if [[ -z "$1" ]]; then
        pdflatex $((find $base/ -type f)| head -n 1) -o $(find $base/ -type f).pdf
    else
        bat $1.md
    fi
    }

catnote() {
  # If note not specified, cat most recent
  if [[ -z "$1" ]]; then
    bat $(ls -t $(find $base/ -type f) | head -n 1)
  else
    bat $base/$1.md
  fi
}

lsnotes() {
  #ls -1 $base/ | sed "s/\(.*\).md/* \1/"
  echo
  echo -e "Last Modified\tName"
  ls $base/ | tr -s ' ' | cut -d ' ' -f 6,7,8,9 | sed  "s/^\(\w\+\) \(\w\w\) \(\w\w:\w\w\) \(.*\).wiki/\1 \2 \3\t\4/"
  echo
}

findnote() {
  if [[ -n "$1" ]]; then
    contents="Note:Line:Text\n\n"
    contents=$contents$(find $base/ -type f | xargs grep -n -i "$1" | sed "s/.*\/\(.*\)\.md:\([0-9]\+\):\(.*\)/\1:\2:\3/")
    echo -e "$contents" | column -s ":" -t
  else
    echo "Please specify a search term."
  fi
}

mvnote() {
  mv $base/$1.md ~/Documents/Notes/$2.md
}

rmnote() {
  if [[ -n "$1" ]]; then
    rm $base/$1.md
  else
    echo "Please specify a note."
  fi
}

