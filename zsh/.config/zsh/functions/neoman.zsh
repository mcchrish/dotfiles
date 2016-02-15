function _nman {
  local l=$#
  local page=(${@:1:$l-1})
  if [[ -z "$page" ]]; then
    echo "What manual page do you want?"
    return
  fi
  local tmp=$IFS
  IFS=$'\n' out=($(command man -w ${page[@]} 2>&1))
  local code=$?
  IFS=$tmp
  if [[ ${#out[@]} > 1 ]]; then
    echo "Too many manpages"
    return
  elif [[ $code != 0 ]]; then
    echo "No manual entry for ${page[*]}"
    return
  fi
  if [[ -z $NVIM_LISTEN_ADDRESS ]]; then
    command nvim -u $XDG_CONFIG_HOME/nvim/mininit.vim -c "${@: -1} ${page[*]}"
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

compdef nman="man"
compdef nman!="man"
