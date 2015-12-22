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


# Jenv
eval "$(jenv init -)"

# Fasd
fasd_cache="$HOME/.cache/fasd"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# For Gruvbox
source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Functions
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh

# Completions
[[ -f ~/.zsh/completions.zsh ]] && source ~/.zsh/completions.zsh

# Aliases
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh

# Aliases
[[ -f ~/.zsh/keybindings.zsh ]] && source ~/.zsh/keybindings.zsh
