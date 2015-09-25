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
alias v='f -e nvim'
alias vim=nvim
alias tmux="TERM=screen-256color-bce tmux"

# Remove delay
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# For Gruvbox
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Fast vim swithing from sheerun
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Fix for tmux <c-h> navigation
# export TERM='xterm-256color'
