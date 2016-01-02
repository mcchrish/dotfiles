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

  # Fuzzy filter
  zplug "junegunn/fzf", \
    of:"shell/key-bindings.zsh" \

  zplug "junegunn/fzf", \
    of:"shell/completion.zsh" \

  zplug "junegunn/fzf", \
    as:command, \
    do:"./install --bin", \
    of:"bin/fzf-tmux", \
    file:fzf-tmux, \
    nice:11

  zplug "junegunn/fzf", \
    as:command, \
    of:"bin/fzf", \
    file:fzf, \
    nice:12

  # Improved cd
  ENHANCD_DISABLE_DOT=1
  zplug "b4b4r07/enhancd", of:enhancd.sh

  # Zsh Completions
  zplug "zsh-users/zsh-completions"

  # History
  zplug "zsh-users/zsh-history-substring-search"

  # Syntax Highlighting
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
  zplug "zsh-users/zsh-syntax-highlighting", nice:18

  # Install plugins if there are plugins that have not been installed
  zplug check || zplug install

  zplug load

fi

unset zplug_dir

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

unset source_dir

# Ensure unique path
typeset -gU cdpath fpath mailpath path
