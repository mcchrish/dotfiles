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

# Listing
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# PAGER
export PAGER=less
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

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

# Zplug
export ZPLUG_HOME="$XDG_CONFIG_HOME/zplug"

# Zsh
if [[ ! -d "${XDG_DATA_HOME}/zsh" ]]; then
  mkdir -p "${XDG_DATA_HOME}/zsh"
fi

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

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
