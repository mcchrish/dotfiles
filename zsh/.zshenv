#===============================================================================
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Zsh .zshenv
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#===============================================================================

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

# Zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

# Remove delay
export KEYTIMEOUT=1

# Zplug
export ZPLUG_HOME="$XDG_CACHE_HOME/zplug"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

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
export NPM_CONFIG_PROGRESS=false

# Babel
export BABEL_CACHE_PATH="$XDG_CACHE_HOME/babel/babel.json"

export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node/repl_history"

# Gradle
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"

# Postgres
export PSQL_HISTORY="$XDG_CACHE_HOME/psql/history"
# MySQL
export  MYSQL_HISTFILE="$XDG_CACHE_HOME/mysql/history"

# Httpie
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Mail
export MBOX="$XDG_DATA_HOME/mail/mbox"

# PATHs
path=(
  /usr/local/{bin,sbin}
  $ANDROID_HOME/{tools,platform-tools}
  $HOME/.jenv/bin
  $HOME/.fastlane/bin
  $ZPLUG_HOME/bin
  $path
)

# Ensure unique path
typeset -gU cdpath fpath mailpath path
