# Emacs is better in cli
bindkey -e

# Use vim-like keys for history substring
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Shift + Tab for cycle back completions
bindkey '^[[Z' reverse-menu-complete

# Edit command
bindkey '^X^E' edit-command-line

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

# FZF
source "${HOME}/.fzf/shell/key-bindings.zsh"
