# Open file
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
function fe {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fcd - cd to selected directory
function fcd {
  local dir
  dir=$(fd . "${1:-.}" --type=d | fzf --no-multi --layout=reverse --height=40%) &&
  cd "$dir"
}

# fcda - including hidden directories
function fcda {
  local dir
  dir=$(fd . "${1:-.}" --hidden --type=d | fzf --no-multi --layout=reverse --height=40%) &&
  cd "$dir"
}

# cdf - cd into the directory of the selected file
function cds {
  local file
  local dir
  file=$(fzf --query "$1" --no-multi --layout=reverse --height=40%) && dir=$(dirname "$file") && cd "$dir"
}

# Git

# fcb - git commit browser
function fcb {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
function fgst {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# fbr - checkout git branch (including remote branches)
function fbr {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
    fzf --delimiter=$(( 2 + $(wc -l <<< "$branches") )) --no-multi --layout=reverse --height=40%) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fcoc - checkout git commit
function fcoc {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac --no-sort --no-multi --exact) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# Tmux
function fta {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --layout=reverse --height=20% --query="$1" --select-1 --exit-0) &&
  tmux -CC attach -d -t "$session"
}
