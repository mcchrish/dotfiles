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

# Emacs is better in cli
bindkey -e


source_dir="$XDG_CONFIG_HOME/zsh"

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

  # Improved cd
  zplug "b4b4r07/enhancd", of:enhancd.sh

  # Fuzzy filter
  zplug "junegunn/fzf", \
    as:command, \
    do:"./install --bin", \
    of:"bin/fzf", \
    file:fzf \

  zplug "junegunn/fzf", \
    as:command, \
    of:"bin/fzf-tmux", \
    file:fzf-tmux \

  zplug "junegunn/fzf", \
    as:plugin, \
    of:"shell/completion.zsh", \
    nice: 12

  zplug "junegunn/fzf", \
    as:plugin, \
    of:"shell/key-bindings.zsh", \
    nice: 13


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

# For Gruvbox
source "$XDG_CONFIG_HOME/nvim/plugged/gruvbox/gruvbox_256palette.sh"

# Completions
[[ -f "$source_dir/completions.zsh" ]] && source "$source_dir/completions.zsh"

# Keybindings
[[ -f "$source_dir/keybindings.zsh" ]] && source "$source_dir/keybindings.zsh"

# Functions
[[ -f "$source_dir/functions.zsh" ]] && source "$source_dir/functions.zsh"

# Aliases
[[ -f "$source_dir/aliases.zsh" ]] && source "$source_dir/aliases.zsh"

# enhancd bug workaround
export ENHANCD_DIR="$XDG_CACHE_HOME/enhancd"
export ENHANCD_LOG="$ENHANCD_DIR/enhancd.log"
