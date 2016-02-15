# cd into the current Finder directory
cdf() {
  local dir
  dir=$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)' 2> /dev/null) \
    && cd "$dir"
}
