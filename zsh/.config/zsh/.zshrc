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

local srcdir="$XDG_CONFIG_HOME/zsh"

# Shell options
[[ -f "$srcdir/shelloptions.zsh" ]] && source "$srcdir/shelloptions.zsh"

### Added by zinit's installer
source "$srcdir/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk

export PURE_PROMPT_SYMBOL="❫"
zstyle :prompt:pure:path color red
zstyle :prompt:pure:git:branch color green
zstyle :prompt:pure:git:branch:cached color green
zstyle :prompt:pure:git:dirty color 89
zstyle :prompt:pure:prompt:error color 94
zinit ice compile"(pure|async).zsh" pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

export FZF_DEFAULT_OPTS="--color=16 --color='fg+:#eeeeee,bg+:#4e4e4e,hl:#00875f,hl+:#00875f,marker:#eeeeee,prompt:#767676'"
export FZF_DEFAULT_COMMAND="fd --type f \
  --hidden \
  --exclude .git \
  --exclude .DS_Store \
  --exclude .localized"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
zinit ice multisrc"shell/{key-bindings,completion}.zsh"
zinit light junegunn/fzf

export _ZL_DATA="$XDG_DATA_HOME/zl"
zinit ice silent wait"1a"
zinit light skywind3000/z.lua
alias j="z -I"

zinit ice silent wait"0a" atload"zpcompinit"
zinit light zsh-users/zsh-completions

zinit ice silent wait"0b"
zinit light zsh-users/zsh-history-substring-search

# Completions
[[ -f "$srcdir/completions.zsh" ]] && source "$srcdir/completions.zsh"

# Keybindings
[[ -f "$srcdir/keys.zsh" ]] && source "$srcdir/keys.zsh"

# Functions
for fn ($srcdir/functions/*.zsh) source $fn

# Aliases
[[ -f "$srcdir/aliases.zsh" ]] && source "$srcdir/aliases.zsh"

eval "$(rbenv init -)"

# Ensure unique path
typeset -gU cdpath fpath mailpath path
