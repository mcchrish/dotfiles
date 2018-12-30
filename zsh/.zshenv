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

# PAGER
export PAGER=less
export LESS='-F -g -i -M -R -S -w -X -z-4 -j4'
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# LS
export CLICOLOR=1

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

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Manually moving some to XDG
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export npm_config_userconfig="$XDG_CONFIG_HOME/npm/config"
export npm_config_cache="$XDG_CACHE_HOME/npm"
export npm_config_prefix="$XDG_DATA_HOME/npm"
export npm_config_init_module="$XDG_DATA_HOME/npm/config/npm-init.js"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node/repl_history"
export BABEL_CACHE_PATH="$XDG_CACHE_HOME/babel/babel.json"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle" BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle" BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem/specs"
export CP_HOME_DIR="$XDG_CACHE_HOME/cocoapods"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"
export PSQL_HISTORY="$XDG_CACHE_HOME/psql/history"
export MYSQL_HISTFILE="$XDG_CACHE_HOME/mysql/history"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MBOX="$XDG_DATA_HOME/mail/mbox"
export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android"

# PATHs
path=(
  $HOME/Library/Python/3.7/bin
  $XDG_DATA_HOME/gem/bin
  $XDG_DATA_HOME/npm/bin
  $ANDROID_HOME/{emulator,tools,tools/bin,platform-tools}
  $path
)

# Ensure unique path
typeset -gU cdpath fpath mailpath path
