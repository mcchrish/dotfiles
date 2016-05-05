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

# Emacs is better in cli
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
bindkey -e


local source_dir="$XDG_CONFIG_HOME/zsh"

# Shell options
[[ -f "$source_dir/shelloptions.zsh" ]] && source "$source_dir/shelloptions.zsh"

###################
# zplug
###################

# Check if zplug is installed
if [[ ! -d "$ZPLUG_HOME" ]]; then
  git clone https://github.com/zplug/zplug "$ZPLUG_HOME"
  source "$ZPLUG_HOME/init.zsh" && zplug update --self
fi

if [[ -s "$ZPLUG_HOME/zplug" ]]; then

  source "$ZPLUG_HOME/init.zsh"

  zplug "zplug/zplug"

  # Prompt
  zplug "mafredri/zsh-async"
  zplug "sindresorhus/pure"

  # Fuzzy filter
  zplug "junegunn/fzf", \
    hook-build:"./install --bin", \
    use:"shell/{key-bindings,completion}.zsh"

  zplug "junegunn/fzf", \
    as:command, \
    use:"bin/{fzf,fzf-tmux}"

  local fzf_man="$ZPLUG_HOME/repos/junegunn/fzf/man"
  if [[ ! "$MANPATH" == *$fzf_man* && -d "$fzf_man" ]]; then
    export MANPATH="$MANPATH:$fzf_man"
  fi

  # Textplay - convert fountain to HTML
  zplug "olivertaylor/Textplay", \
    as:command, \
    use:"textplay"

  # Improved cd
  export ENHANCD_DISABLE_DOT=1
  zplug "b4b4r07/enhancd", use:enhancd.sh

  # Zsh Completions
  zplug "zsh-users/zsh-completions"

  # Syntax Highlighting
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
  zplug "zsh-users/zsh-syntax-highlighting", nice:11

  # History
  zplug "zsh-users/zsh-history-substring-search", nice:12

  # Install plugins if there are plugins that have not been installed
  zplug check || zplug install

  zplug load

fi

# Jenv
# eval "$(jenv init -)"

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
