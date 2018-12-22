# General
alias mkdir="nocorrect mkdir -p"
alias mv="nocorrect mv -i"
alias cp="nocorrect cp -i"
alias rm="nocorrect rm -i"
alias trs="nocorrect trash"
alias man="nocorrect man"
alias ln="nocorrect ln"
alias du="du -h"
alias df="df -h"
alias which="command -v"
# alias sudo="sudo "
alias htop="sudo htop"
alias ql="qlmanage -p"
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
alias -g F="| fpp"
alias -g Z="| fzf"
alias -g G="| ag"
alias -g C="| pbcopy"

# Fzf
alias ff="fzf"
alias agc="ag --nobreak --nonumbers --noheading . | fzf"
alias agC="ag --nobreak --nonumbers --noheading --hidden --path-to-ignore="$XDG_CONFIG_HOME/ag/fzfignore" . | fzf"

# Tmux
alias t="tmux"
alias ta="tmux attach -t"
alias tcc="tmux -CC"
alias tcca="tmux -CC attach -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"

# Tmuxp
alias tp="tmuxp"
alias tpl="tmuxp load"

# Cd
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."

# Misc
alias rng="ranger"
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
alias gcA="git commit -S --amend --reuse-message HEAD"

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
alias ls="exa"
alias l="ls --oneline --all"
alias ll="ls --long"
alias lr="ll --recurse"
alias la="ll --all"
alias lt="ll --tree"
alias ly="la --tree"
alias lg="la --git --git-ignore"
alias lk="ll --sort=size"
alias lm="ll --reverse --sort=modified"
alias lc="lm --created --header"
alias lu="lm --accessed --header"
alias sl="ls"

# Clipboard
alias pbc="pbcopy"
alias pbp="pbpaste"
