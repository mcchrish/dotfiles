# Cmus
alias cmus="cmus 2> /dev/null"
alias cplay="cmus-remote --play"
alias cpause="cmus-remote --pause"
alias cnext="cmus-remote --next"
alias cprev="cmus-remote --prev"

# Fzf
alias ff="fzf"

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias ta="tmux attach -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"

# Misc
alias say="say -v Daniel"
alias mtr="meteor"
alias rng="ranger"
alias py="python"
alias g="git"
alias cask="brew cask"
alias mkdir="nocorrect mkdir -p"

# ls
alias ls="ls -G"
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # I often screw this up.

# Clipboard
alias pbc='pbcopy'
alias pbp='pbpaste'
