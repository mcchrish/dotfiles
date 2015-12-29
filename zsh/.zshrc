# fpaths
fpath=(~/.zsh/Completion(N-/) $fpath)
fpath=(~/.zsh/functions/*(N-/) $fpath)

# Autoloads
autoload -Uz url-quote-magic
autoload -Uz colors; colors
autoload -Uz compinit; compinit -u
zle -N self-insert url-quote-magic

# Shell options
[[ -f "$XDG_CONFIG_HOME/zsh/shelloptions.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/shelloptions.zsh"


# Check zplug location
if [[ -z "${XDG_CONFIG_HOME}" ]]; then
  _zplug_dir="${ZDG_CONFIG_HOME}/zplug"
else
  _zplug_dir="${HOME}/.config/zplug"
fi

# Check if zplug is installed
if [[ ! -d "${_zplug_dir}" ]]; then
  curl -fLo "${_zplug_dir}/zplug" --create-dirs https://git.io/zplug
  source "${_zplug_dir}/zplug" && zplug update --self
fi

if [[ -s "${_zplug_dir}/zplug" ]]; then

  source "${_zplug_dir}/zplug"

  # Prompt
  zplug "mafredri/zsh-async"
  zplug "sindresorhus/pure"

  # Zsh Completions
  zplug "zsh-users/zsh-completions"

  # Syntax Highlighting
  zplug "zsh-users/zsh-syntax-highlighting"
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

  # History
  zplug "zsh-users/zsh-history-substring-search", nice:10

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load

fi

# Jenv
# eval "$(jenv init -)"

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

# Keybindings
[[ -f "$XDG_CONFIG_HOME/zsh/keybindings.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/keybindings.zsh"
