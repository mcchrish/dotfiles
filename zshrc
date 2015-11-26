# Source Prezto.
if [[ -s "${HOME}/.zgen/zgen.zsh" ]]; then
  source "${HOME}/.zgen/zgen.zsh"
  ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
fi

if ! zgen saved; then
  zgen prezto editor key-bindings 'emacs'
  zgen prezto prompt theme 'pure'
  zgen prezto dot-expansion 'yes'
  zgen prezto '*:*' color 'yes'
  zgen prezto syntax-highlighting highlighters \
   'main' \
   'brackets' \
   'pattern' \
   'cursor' \
   'root'
  zgen prezto terminal auto-title 'yes'
  zgen prezto 'terminal:window-title' format '%n@%m: %s'
  zgen prezto 'terminal:tab-title' format '%m: %s'
  zgen prezto 'tmux:iterm' integrate 'yes'

  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto tmux
  zgen prezto directory
  zgen prezto completion
  zgen prezto osx
  zgen prezto git
  zgen prezto spectrum
  zgen prezto homebrew
  zgen prezto node
  zgen prezto command-not-found
  zgen prezto history
  zgen prezto utility
  zgen prezto fasd
  zgen prezto syntax-highlighting
  zgen prezto history-substring-search
  zgen prezto prompt

  zgen save
fi

# Customize to your needs...
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
eval "$(jenv init -)"
eval "$(fasd --init auto)"
export EDITOR='nvim'
export VISUAL='nvim'

# Some aliases
alias v="f -e vim"
alias nv="f -e nvim"
alias tmux="TERM=screen-256color-bce tmux"
alias tmuxat="tmux attach -t"
alias say="say -v Daniel"
alias mtr="meteor"
alias cmus="cmus 2> /dev/null"
alias cplay="cmus-remote --play"
alias cpause="cmus-remote --pause"
alias cnext="cmus-remote --next"
alias cprev="cmus-remote --prev"

# Remove delay
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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
