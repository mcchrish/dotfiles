# General
alias mkdir="nocorrect mkdir -p"
alias mv="nocorrect mv"
alias cp="nocorrect cp"
alias rm="nocorrect rm"
alias man="nocorrect man"
alias ln="nocorrect ln"
alias du="du -h"
alias df="df -h"
alias which="command -v"
alias sudo="sudo "

# Vim
alias v="vim"
alias mv="mvim"
alias nv="nvim"
alias minv="nvim -u $XDG_CONFIG_HOME/nvim/mininit.vim"

# Quick piping
alias -g L="| less"
alias -g F="| fpp"
alias -g Z="| fzf"
alias -g G="| ag"
alias -g C="| pbcopy"

# Cmus
alias cmus="cmus 2> /dev/null"
alias cplay="cmus-remote --play"
alias cpause="cmus-remote --pause"
alias cnext="cmus-remote --next"
alias cprev="cmus-remote --prev"

# Fzf
alias ff="fzf"
alias agc="ag --nobreak --nonumbers --noheading . | fzf"
alias agC="ag --nobreak --nonumbers --noheading --hidden --path-to-agignore="$XDG_CONFIG_HOME/ag/fzfignore" . | fzf"

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias ta="tmux attach -t"
alias tcc="tmux -CC"
alias tcca="tmux -CC attach -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"

# Cd
alias ".."="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdh="cd ~"
alias j="cd -"

# Misc
alias say="say -v Daniel"
alias mtr="meteor"
alias rng="ranger"
alias py="python"
alias cask="brew cask"

#
# Git
#

# Branch
alias g="git"
alias gb="git branch"
alias gbc="git checkout -b"
alias gbx="git branch -d"
alias gbX="git branch -D"

# Commit
alias gc="git commit --verbose"
alias gco="git checkout"
alias gcA="git commit --amend --reuse-message HEAD"

# Reset
alias gcr="git checkout --ours --"

# Files
alias gls="git ls-files"

# Fetch
alias gf="git fetch"
alias gpl="git pull"

# Index
alias ga="git add"

# Log
alias gl="git log --topo-order --abbrev-commit --pretty=format:'%C(auto)%h %ae%n%s%n' "
alias gll="git log --topo-order --oneline"
alias glv="git log --topo-order --pretty=medium"
alias glf="fshow"

# Merge
alias gm="git merge"

# Push
alias gp="git push"
alias gpu="git push -u"

# Rebase
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"

# Stash
alias gst="git stash"
alias gsa="git stash apply"
alias gsx="git stash drop"
alias gsp="git stash pop"

# Status
alias gs="git status --short"
alias gsv="git status"
alias gd="git diff"


# ls
alias ls="ls -G"
alias l="ls -1A"         # Lists in one column, hidden files.
alias ll="ls -lh"        # Lists human readable sizes.
alias lr="ll -R"         # Lists human readable sizes, recursively.
alias la="ll -A"         # Lists human readable sizes, hidden files.
alias lm="la | $PAGER"   # Lists human readable sizes, hidden files through pager.
alias lx="ll -XB"        # Lists sorted by extension (GNU only).
alias lk="ll -Sr"        # Lists sorted by size, largest last.
alias lt="ll -tr"        # Lists sorted by date, most recent last.
alias lc="lt -c"         # Lists sorted by date, most recent last, shows change time.
alias lu="lt -u"         # Lists sorted by date, most recent last, shows access time.
alias sl="ls"            # I often screw this up.

# Clipboard
alias pbc="pbcopy"
alias pbp="pbpaste"
