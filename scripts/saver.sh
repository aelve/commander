# append it to the history file
append_current_line() {
  if [ -n "$ZSH_VERSION" ]; then
    local cur_line="$BUFFER"
  elif [ -n "$BASH_VERSION" ]; then
    local cur_line="$READLINE_LINE"
  else
   # asume something else, TODO
  fi
  echo "$cur_line" >> ~/.commander/history
}

# create the history file
mkdir -p ~/.commander
touch ~/.commander/history

# declare a new widget
zle -N lookit
# bind widget to Ctrl+k 
bindkey '\ek' lookit

