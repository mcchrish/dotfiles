# Language
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# XDG
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="$HOME/.cache"
fi

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
fi

if [[ -z "$XDG_DATA_DIRS" ]]; then
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

if [[ -z "$XDG_CONFIG_DIRS" ]]; then
  export XDG_CONFIG_DIRS="/etc/xdg"
else
  export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"
fi

# Zplug
export ZPLUG_HOME="$XDG_CACHE_HOME/zplug"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Listing
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# PAGER
export PAGER=less
export LESS='-F -g -i -M -R -S -w -X -z-4 -j4'
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

# Terminfo / ncurses
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# Pass
export PASSWORD_STORE_DIR="$HOME/.password-store"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# Node
if [[ ! -d "${XDG_DATA_HOME}/node" ]]; then
  mkdir -p "${XDG_DATA_HOME}/node"
fi

export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node/repl_history"

# FZF
export FZF_DEFAULT_COMMAND="ag -l --hidden --path-to-agignore=\"$XDG_CONFIG_HOME/ag/fzfignore\" -g \"\""
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Enhancd
export ENHANCD_DIR="$XDG_CACHE_HOME/enhancd"

local fzf_man="$ZPLUG_HOME/repos/junegunn/fzf/man"
if [[ ! "$MANPATH" == *$fzf_man* && -d "$fzf_man" ]]; then
  export MANPATH="$MANPATH:$fzf_man"
fi

# Postgres
export PSQL_HISTORY="$XDG_CACHE_HOME/psql/history"

# Httpie
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"

# Mail
export MBOX="$XDG_DATA_HOME/mail/mbox"

# Zsh
if [[ ! -d "${XDG_DATA_HOME}/zsh" ]]; then
  mkdir -p "${XDG_DATA_HOME}/zsh"
fi

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

# Remove delay
export KEYTIMEOUT=1

# PATHs
path=(
  /usr/local/{bin,sbin}
  $ANDROID_HOME/{tools,platform-tools}
  $HOME/.jenv/bin
  $path
)

# Ensure unique path
typeset -gU cdpath fpath mailpath path
