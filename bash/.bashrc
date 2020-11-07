$DOTFILES_DIR="$HOME/dotfiles"

# See bash(1) for more options
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# for setting history length 
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

for DOTFILE in "$DOTFILES_DIR"/system/.{function,path,env,alias}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done
