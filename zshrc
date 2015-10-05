# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
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
alias say="say -v Daniel"

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
