# Extra PATHs
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# PAGER
PAGER=less
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'

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
