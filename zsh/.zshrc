# Source zgen
if [[ -z "${XDG_CACHE_HOME}" ]]; then
  _zgen_dir="${ZDG_CONFIG_HOME}/zgen"
else
  _zgen_dir="${HOME}/.config/zgen"
fi

if [[ -s "${_zgen_dir}/zgen.zsh" ]]; then
  source "${_zgen_dir}/zgen.zsh"
fi

if ! zgen saved; then
  zgen prezto editor key-bindings 'emacs'
  zgen prezto prompt theme 'pure'
  zgen prezto editor dot-expansion 'yes'
  zgen prezto '*:*' color 'yes'
  zgen prezto syntax-highlighting highlighters \
   'main' \
   'brackets' \
   'pattern' \
   'cursor' \
   'root'
  zgen prezto terminal auto-title 'yes'

  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto directory
  zgen prezto git
  zgen prezto homebrew
  zgen prezto utility
  zgen prezto completion
  zgen prezto syntax-highlighting
  zgen prezto history-substring-search
  zgen prezto prompt

  zgen save
fi


# Jenv
eval "$(jenv init -)"

# Fasd
if [[ ! -d "${XDG_CACHE_HOME}/fasd" ]]; then
  mkdir -p "${XDG_CACHE_HOME}/fasd"
fi

fasd_cache="$XDG_CACHE_HOME/fasd/fasd_cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# For Gruvbox
source "$XDG_CONFIG_HOME/nvim/plugged/gruvbox/gruvbox_256palette.sh"

# Functions
[[ -f "$XDG_CONFIG_HOME/zsh/functions.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/functions.zsh"

# Completions
[[ -f "$XDG_CONFIG_HOME/zsh/completions.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/completions.zsh"

# Aliases
[[ -f "$XDG_CONFIG_HOME/zsh/aliases.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/aliases.zsh"

# Aliases
[[ -f "$XDG_CONFIG_HOME/zsh/keybindings.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/keybindings.zsh"
