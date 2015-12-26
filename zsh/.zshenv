# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Extra PATHs
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Setup fzf
if [[ ! "$PATH" == */Users/mclopez/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/mclopez/.fzf/bin"
fi

# Fzf Man path
if [[ ! "$MANPATH" == */Users/mclopez/.fzf/man* && -d "/Users/mclopez/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/mclopez/.fzf/man"
fi

# PAGER
export PAGER=less
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Pass
export PASSWORD_STORE_DIR="$HOME/.password-store"

# FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Remove delay
export KEYTIMEOUT=1
