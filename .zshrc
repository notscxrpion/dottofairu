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
alias dotfile='/usr/bin/git --git-dir=$HOME/.dottofairu/ --work-tree=$HOME'
#alias ll='ls -lah'
alias cc='curl rate.sx'
alias temp='watch -n 2 sensors'
alias nwspeed='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias forecast='curl wttr.in'
alias nasty='smbclient //192.168.1.53/scxrpion -U scxrpion'
alias prc='xfreerdp /u:"scxrpion" /v:10.0.0.97 /dynamic-resolution'
alias nextcloud='sudo mount -t davfs https://scxrpion.duckdns.org:8283/remote.php/dav/files/ncadmin/ NextCloud/ -o noexec'

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
