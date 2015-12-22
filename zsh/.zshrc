# Source zgen
if [[ -s "${HOME}/.zgen/zgen.zsh" ]]; then
  source "${HOME}/.zgen/zgen.zsh"
fi

if ! zgen saved; then
  zgen prezto editor key-bindings 'emacs'
  zgen prezto prompt theme 'pure'
  zgen prezto editor dot-expansion 'yes'
  zgen prezto '*:*' color 'yes'
  zgen prezto syntax-highlighting highlighters \
   'main' \
   'brackets' \
   'pattern' \
   'cursor' \
   'root'
  zgen prezto terminal auto-title 'yes'
  zgen prezto 'terminal:window-title' format '%n@%m: %s'
  zgen prezto 'terminal:tab-title' format '%m: %s'

  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto directory
  zgen prezto osx
  zgen prezto git
  zgen prezto homebrew
  zgen prezto node
  zgen prezto python
  zgen prezto command-not-found
  zgen prezto history
  zgen prezto utility
  zgen prezto completion
  zgen prezto syntax-highlighting
  zgen prezto history-substring-search
  zgen prezto prompt

  zgen save
fi

# Extra PATHs
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Pass
export PASSWORD_STORE_DIR="$HOME/.password-store"

# Jenv
eval "$(jenv init -)"

# Fasd
fasd_cache="$HOME/.cache/fasd"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias posix-hook >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Some aliases
alias say="say -v Daniel"
alias mtr="meteor"
alias cmus="cmus 2> /dev/null"
alias cplay="cmus-remote --play"
alias cpause="cmus-remote --pause"
alias cnext="cmus-remote --next"
alias cprev="cmus-remote --prev"

# Fzf
alias ff="fzf"

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias ta="tmux attach -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"

# Remove delay
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# For Gruvbox
source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"

# Fast vim swithing from sheerun
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
