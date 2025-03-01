# Language
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export LESS='-F -g -i -M -R -S -w -X -z-4 -j4'

# LS
export CLICOLOR=1
export LSCOLORS=Hxfxcxdxbxhgahhbhehchd
export LS_COLORS='di=1;37:ln=35:so=32:pi=33:ex=31:bd=37;46:cd=30;47:su=37;41:sg=37;44:tw=37;42:ow=37;43'

# Android
export ANDROID_SDK_ROOT="$HOME"/Library/Android/sdk
export ANDROID_HOME="$HOME"/Library/Android/sdk

export RBENV_VERSION=3.1.1

export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1

# Manually moving some to XDG
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/rg/config
export npm_config_userconfig="$XDG_CONFIG_HOME"/npm/config
export npm_config_cache="$XDG_CACHE_HOME"/npm
export npm_config_prefix="$XDG_DATA_HOME"/npm
export npm_config_init_module="$XDG_DATA_HOME"/npm/config/npm-init.js
export NO_UPDATE_NOTIFIER=1
export NVM_DIR="$XDG_DATA_HOME"/nvm
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node/repl_history
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export PUB_CACHE="$XDG_CACHE_HOME"/pub-cache
export GEM_HOME="$XDG_DATA_HOME"/gem
# export RBENV_ROOT="$XDG_DATA_HOME"/rbenv
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem/specs
export CP_HOME_DIR="$XDG_CACHE_HOME"/cocoapods
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GRADLE_USER_HOME="$XDG_CACHE_HOME"/gradle
export PSQL_HISTORY="$XDG_DATA_HOME"/psql/history
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql/history
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MBOX="$XDG_DATA_HOME"/mail/mbox
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
# export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
# export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
# export VOLTA_HOME="$XDG_DATA_HOME"/volta


path+=(
  "$XDG_DATA_HOME"/gem/bin
  "$XDG_DATA_HOME"/cargo/bin
  "$XDG_DATA_HOME"/npm/bin
  "$HOME"/Library/Python/3.9/bin
  # "$VOLTA_HOME"/bin
  "$ANDROID_HOME"/{emulator,tools,tools/bin,platform-tools}
)

eval "$(/opt/homebrew/bin/brew shellenv)"

# Ensure unique path
typeset -gU cdpath fpath mailpath path
