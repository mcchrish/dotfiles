# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# PAGER
export PAGER=less
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# gnupg
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# Pass
export PASSWORD_STORE_DIR="$HOME/.password-store"

# FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [[ ! "$MANPATH" == *$HOME.fzf/man* && -d "$HOME.fzf/man" ]]; then
  export MANPATH="$MANPATH:$HOME.fzf/man"
fi

# Postgres
export PSQL_HISTORY="$XDG_CACHE_HOME/psql/history"

# Mail
export MBOX="$XDG_DATA_HOME/mail/mbox"

# Remove delay
export KEYTIMEOUT=1

# Zgen
export ZGEN_DIR="$XDG_CONFIG_HOME/zgen"
export ZGEN_PREZTO_LOAD_DEFAULT=0

# Zsh
if [[ ! -d "${XDG_DATA_HOME}/zsh" ]]; then
  mkdir -p "${XDG_DATA_HOME}/zsh"
fi

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

# Fzf path
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  _fzf_path="$HOME/.fzf/bin"
fi

# Jen path
if [[ ! "$PATH" == *$HOME/.jenv/bin* ]]; then
  _jenv_path="$HOME/.jenv/bin"
fi

# PATHs
typeset -gU cdpath fpath mailpath path

path=(
  /usr/local/{bin,sbin}
  $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
  $_jenv_path
  $_fzf_path
  $path
)
