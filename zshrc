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
