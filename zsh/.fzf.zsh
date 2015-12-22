# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/mclopez/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/mclopez/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/mclopez/.fzf/man* && -d "/Users/mclopez/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/mclopez/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/mclopez/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/mclopez/.fzf/shell/key-bindings.zsh"


# pass completion suggested by @d4ndo (#362)
_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
  pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
  stringsize="${#pwdir}"
  find "$pwdir" -name "*.gpg" -print |
    cut -c "$((stringsize + 1))"-  |
    sed -e 's/\(.*\)\.gpg/\1/'
  )
}

[ -n "$BASH" ] && complete -F _fzf_complete_pass -o default -o bashdefault pass

#Suggested by @l4u and @epiloque
# V
nv() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && nvim "${file}" || return 1
}

#Suggested by @l4u and @epiloque
# Z
z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

alias j=z

# Git

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
    --bind "ctrl-m:execute:
              echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'git show --color=always % | less -R'"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
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
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
  fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fcoc - checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}
