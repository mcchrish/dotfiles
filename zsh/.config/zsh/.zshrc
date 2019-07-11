# General
autoload -Uz colors; colors
autoload history-search-end

# Smart Url
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Edit command line with EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line

WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# Emacs keybindings
bindkey -e

local source_dir="$XDG_CONFIG_HOME/zsh"

# Shell options
[[ -f "$source_dir/shelloptions.zsh" ]] && source "$source_dir/shelloptions.zsh"

### Added by Zplugin's installer
source "/Users/mcchris/.config/zsh/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

export PURE_PROMPT_SYMBOL="❫"
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

export FZF_DEFAULT_OPTS="--color=16"
export FZF_DEFAULT_COMMAND="fd --type f \
  --hidden \
  --exclude .git \
  --exclude .DS_Store \
  --exclude .localized
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
zplugin ice multisrc"shell/{key-bindings,completion}.zsh"
zplugin light junegunn/fzf

export _ZL_DATA="$XDG_DATA_HOME/zl"
zplugin ice silent wait"1a"
zplugin light skywind3000/z.lua
alias j="z -I"

zplugin ice silent wait"0a" atload"zpcompinit"
zplugin light zsh-users/zsh-completions

export HISTORY_SUBSTRING_SEARCH_FUZZY=1
zplugin ice silent wait"0b"
zplugin light zsh-users/zsh-history-substring-search

zplugin ice silent wait"1b"
zplugin light zdharma/fast-syntax-highlighting

zplugin ice silent wait"1c" src"completion/tmuxinator.zsh"
zplugin light tmuxinator/tmuxinator

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
