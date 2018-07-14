# NOTE: it works only for bash with version >= 4
# append it to the history file
_save-current-line-bash() {
  echo "$READLINE_LINE" >> ~/.commander/history
}

_init-bash() {
  bind -x "'\ek' : _save-current-line"
}

# append it to the history file
_save-current-line-zsh() {
  echo "$BUFFER" >> ~/.commander/history
}

_init-zsh() {
  zle -N save-current-line _save-current-line
  bindkey '\ek' save-current-line
}

# create the history file
mkdir -p ~/.commander
touch ~/.commander/history

if [ -n "$ZSH_VERSION" ]; then
  _init-zsh
elif [ -n "$BASH_VERSION" ]; then
  _init-bash
else
  # assume something else, TODO
fi

