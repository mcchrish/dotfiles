# Use vim cli mode
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Shift + Tab for cycle back completions
bindkey '^[[Z' reverse-menu-complete

# Edit command
bindkey '^X^E' edit-command-line

# FZF
source "${HOME}/.fzf/shell/key-bindings.zsh"
