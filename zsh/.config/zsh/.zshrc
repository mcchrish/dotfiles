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

### Added by Zplugin's installer
source '/Users/mcchris/.config/zsh/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

export FZF_DEFAULT_COMMAND="rg --hidden --ignore-file=\"$XDG_CONFIG_HOME/ag/fzfignore\" --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
zplugin ice pick"shell/*.zsh" atclone"./install --bin" atpull"%atclone"
zplugin light junegunn/fzf

export _Z_DATA="$XDG_CACHE_HOME/z/data"
zplugin ice src"z.sh"; zplugin light rupa/z

zplugin ice silent wait'0' atload'zpcompinit'
zplugin light zsh-users/zsh-completions

export HISTORY_SUBSTRING_SEARCH_FUZZY=1
zplugin ice silent wait'1'
zplugin light zsh-users/zsh-history-substring-search

zplugin ice silent wait'2'
zplugin light zdharma/fast-syntax-highlighting

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
