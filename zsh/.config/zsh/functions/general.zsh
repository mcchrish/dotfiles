# cd into the current Finder directory
function cdf {
  local dir
  dir=$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)' 2> /dev/null) \
    && cd "$dir"
}

# Makes a directory and changes to it.
function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Changes to a directory and lists its contents.
function cdls {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}
