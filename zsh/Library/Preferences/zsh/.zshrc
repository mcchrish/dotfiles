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

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTSIZE=20000
export SAVEHIST=20000

# Emacs keybindings
bindkey -e

local srcdir="$XDG_CONFIG_HOME/zsh"

# Shell options
source "$srcdir/shelloptions.zsh"

### Added by zinit's installer
source "$srcdir/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk

export PURE_PROMPT_SYMBOL="❫"
zstyle :prompt:pure:path color black
zstyle :prompt:pure:git:branch color green
zstyle :prompt:pure:git:branch:cached color green
zstyle :prompt:pure:git:dirty color red
zstyle :prompt:pure:prompt:error color red
zinit ice compile"(pure|async).zsh" pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

export FZF_DEFAULT_OPTS="--color=16 --color='fg:bright-black,fg+:black:bold,bg+:bright-white,hl:magenta:bold,marker:white:bold,prompt:red,info:blue' --bind=down:half-page-down,up:half-page-up"
export FZF_DEFAULT_COMMAND="fd --type f \
  --hidden \
  --exclude .git \
  --exclude .DS_Store \
  --exclude .localized"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_PREVIEW_COMMAND="cat {}"
zinit ice multisrc"shell/{key-bindings,completion}.zsh"
zinit light junegunn/fzf

zinit ice silent wait"0b"
zinit light zsh-users/zsh-history-substring-search

zinit ice silent wait"0a" atload"zicompinit; zicdreplay"
zinit light zsh-users/zsh-completions

# Completions
source "$srcdir/completions.zsh"

# Keybindings
source "$srcdir/keys.zsh"

# Functions
for fn ($srcdir/functions/*.zsh) source $fn

# Aliases
source "$srcdir/aliases.zsh"

eval "$(zoxide init zsh --cmd j)"

eval "$(rbenv init -)"

# Ensure unique path
typeset -gU cdpath fpath mailpath path
