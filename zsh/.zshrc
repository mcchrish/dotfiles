# fpaths
fpath=(~/.zsh/Completion(N-/) $fpath)
fpath=(~/.zsh/functions/*(N-/) $fpath)

#
# Autoloads
#

# General
autoload -Uz colors; colors
autoload history-search-end

# Smart Url
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Edit command line with EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line

# Shell options
[[ -f "$source_dir/shelloptions.zsh" ]] && source "$source_dir/shelloptions.zsh"

#
# zplug
#

# Check zplug location
if [[ -z "${XDG_CONFIG_HOME}" ]]; then
  zplug_dir="${ZDG_CONFIG_HOME}/zplug"
else
  zplug_dir="${HOME}/.config/zplug"
fi

# Check if zplug is installed
if [[ ! -d "${zplug_dir}" ]]; then
  curl -fLo "${zplug_dir}/zplug" --create-dirs https://git.io/zplug
  source "${zplug_dir}/zplug" && zplug update --self
fi

if [[ -s "${zplug_dir}/zplug" ]]; then

  source "${zplug_dir}/zplug"

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
  zplug check || zplug install

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

source_dir="$XDG_CONFIG_HOME/zsh"

# Keybindings
[[ -f "$source_dir/keybindings.zsh" ]] && source "$source_dir/keybindings.zsh"

# Functions
[[ -f "$source_dir/functions.zsh" ]] && source "$source_dir/functions.zsh"

# Completions
[[ -f "$source_dir/completions.zsh" ]] && source "$source_dir/completions.zsh"

# Aliases
[[ -f "$source_dir/aliases.zsh" ]] && source "$source_dir/aliases.zsh"
