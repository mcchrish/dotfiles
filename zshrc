#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(fasd --init auto)"
export EDITOR='vim'
export VISUAL='vim'

# Some aliases
alias v='f -e vim'
alias tmux="TERM=screen-256color-bce tmux"

# Remove delay
export KEYTIMEOUT=1

# Use vim cli mode
#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^P' up-line-or-search
#bindkey '^N' down-line-or-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
