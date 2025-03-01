# Language
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# XDG
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME"/.config
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="$HOME"/.cache
fi

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME"/.local/share
fi

if [[ -z "$XDG_STATE_HOME" ]]; then
  export XDG_STATE_HOME="$HOME"/.local/state
fi

if [[ -z "$XDG_DATA_DIRS" ]]; then
  export XDG_DATA_DIRS=/usr/local/share:/usr/share
fi

if [[ -z "$XDG_CONFIG_DIRS" ]]; then
  export XDG_CONFIG_DIRS=/etc/xdg
else
  export XDG_CONFIG_DIRS=/etc/xdg:"$XDG_CONFIG_DIRS"
fi

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# PAGER
export PAGER=less
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# Default Editor
export EDITOR='nvim'
export VISUAL='nvim'
