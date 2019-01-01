# General
alias mkdir="mkdir -p"
alias trs="trash"
alias du="du -kh"
alias df="df -kh"
alias which="command -v"
# alias sudo="sudo "
alias cat='bat'

# Vim
alias v="vim"
alias nv="nvim"

# Nnn
alias nnn="LESS='-g -i -M -R -S -w -X -z-4 -j4' nnn"
alias nn="nnn"

# While in a nvim terminal, open file to current session
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias nvh='nvr -o'
  alias nvv='nvr -O'
  alias nvt='nvr --remote-tab'
fi

# Quick piping
alias -g B="| bat"
alias -g L="| less"
alias -g Z="| fzf"
alias -g G="| rg"
alias -g C="| pbcopy"

# Fzf
alias ff="fzf"

# Tmux
alias t="tmux"
alias ta="tmux attach -t"
alias tcc="tmux -CC"
alias tcca="tmux -CC attach -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"

# Tmuxinator
alias mux="tmuxinator"
alias muxs="tmuxinator start"

# Cd
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."

# Misc
alias py="python"
alias cask="brew cask"

#
# Git
#

# Branch
alias g="git"
alias gb="git branch -vv"
alias gbc="git checkout -b"
alias gbx="git branch -d"
alias gbX="git branch -D"

# Commit
alias gc="git commit -S --verbose"
alias gco="git checkout"
alias gce="git commit -S --amend --reuse-message HEAD"

# Reset
alias gcr="git checkout --ours --"
alias gcR="git reset --soft HEAD\^"

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

# Diff
alias gd="git diff"
alias gds="git diff --stat --color"

# Tag
alias gt="git tag"
alias gta="git tag -s -a"
alias gtd="git tag -d"

# Others
alias ge="git edit"
alias gcl="git clone"

# ls
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # I often screw this up.
alias al='la'            # I often screw this up.

# Clipboard
alias pbc="pbcopy"
alias pbp="pbpaste"
