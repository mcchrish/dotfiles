#===============================================================================
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Zsh .zshrc
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#===============================================================================

###################
# Autoloads
###################

# General
autoload -Uz colors; colors
autoload history-search-end

# Smart Url
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Edit command line with EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Emacs keybindings
bindkey -e

local source_dir="$XDG_CONFIG_HOME/zsh"

# Shell options
[[ -f "$source_dir/shelloptions.zsh" ]] && source "$source_dir/shelloptions.zsh"

###################
# zplug
###################

# Check if zplug is installed
if [[ ! -d "$ZPLUG_HOME" ]]; then
  curl -sL zplug.sh/installer | zsh
  source "$ZPLUG_HOME/init.zsh" && zplug update --self
fi

if [[ -s "$ZPLUG_HOME" ]]; then

  source "$ZPLUG_HOME/init.zsh"

  # zplug "zplug/zplug"

  # Prompt
  zplug "mafredri/zsh-async"
  zplug "sindresorhus/pure"

  # Fuzzy filter
  export FZF_DEFAULT_COMMAND="rg -l --hidden --ignore-file=\"$XDG_CONFIG_HOME/ag/fzfignore\" \"\""
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  zplug "junegunn/fzf", \
    hook-build:"./install --bin", \
    use:"shell/{key-bindings,completion}.zsh"

  # Textplay - convert fountain to HTML
  zplug "olivertaylor/Textplay", \
    as:command, \
    use:"textplay"

  # Z
  export _Z_DATA="$XDG_CACHE_HOME/z/data"
  zplug "rupa/z", use:z.sh

  # Zsh Completions
  zplug "zsh-users/zsh-completions"

  # Syntax Highlighting
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
  zplug "zsh-users/zsh-syntax-highlighting", defer:2

  # History
  zplug "zsh-users/zsh-history-substring-search", defer:3

  # Install plugins if there are plugins that have not been installed
  zplug check || zplug install

  zplug load

fi

# Completions
[[ -f "$source_dir/completions.zsh" ]] && source "$source_dir/completions.zsh"

# Keybindings
[[ -f "$source_dir/keybindings.zsh" ]] && source "$source_dir/keybindings.zsh"

# Functions
for func ($source_dir/functions/*.zsh) source $func

# Aliases
[[ -f "$source_dir/aliases.zsh" ]] && source "$source_dir/aliases.zsh"

# Ensure unique path
typeset -gU cdpath fpath mailpath path
