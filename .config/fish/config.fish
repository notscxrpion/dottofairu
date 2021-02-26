# My fish config.
set -U fish_user_paths $fish_user_paths $HOME/.local/bin/
set fish_greeting                      # Supresses fish's intro message
set TERM "xterm-256color"              # Sets the terminal type
set EDITOR "emacsclient -t -a ''"      # $EDITOR use Emacs in terminal
set VISUAL "emacsclient -c -a emacs"   # $VISUAL use Emacs in GUI mode

### Prompt ###
# This wos the 'fishface' prompt from oh-my-fish.
function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l magenta (set_color -o magenta)
  set -l magenta (set_color -o magenta)

  if [ (_git_branch_name) ]
    echo -n -s "$magenta><(((\"> "
  else
    echo -n -s "$magenta><(((\"> "
  end
end
### END OF PROMPT ###

### DEFAULT EMACS MODE ###
function fish_user_key_bindings
  fish_default_key_bindings
  # fish_vi_key_bindings
end
### END OF EMACS MODE ###

### FUNCTIONS ###
# Functions needed for !! and !$
# Will only work in default (emacs) mode.
# Will NOT work in vi mode.
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
bind ! __history_previous_command
bind '$' __history_previous_command_arguments
### END OF FUNCTIONS ###

### ALIASES ###
alias dotfile='/usr/bin/git --git-dir=$HOME/dottofairu/ --work-tree=$HOME'
#alias ll='ls -lah'
alias cc='curl rate.sx'

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
