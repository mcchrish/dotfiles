function _nman {
  if (( $# > 3 )); then
    echo "Too many arguments"
    return
  elif (( $# == 1 )); then
    echo "What manual page do you want?"
    return
  fi
  local l=$#
  local -a page
  local page=(${@:1:$l-1})
  local tmp=$IFS
  IFS=$'\n' out=($(command man -w ${page[@]} 2>&1))
  local code=$?
  IFS=$tmp
  if [[ ${#out[@]} > 1 ]] && (( $# > 2 )); then
    echo "Too many manpages: ${#out[@]}"
    return
  elif [[ $code != 0 ]]; then
    printf '%s\n' "${out[@]}"
    return
  fi
  if [[ -z $NVIM_LISTEN_ADDRESS ]]; then
    command nvim -c "${@: -1} ${page[*]}"
  else
    nvr --remote-send "<c-n>" -c "${@: -1} ${page[*]}"
  fi
}

function nman {
  _nman "$@" 'Nman'
}

function nman! {
  _nman "$@" 'Nman!'
}

compdef nman!="man"
compdef nman="man"
