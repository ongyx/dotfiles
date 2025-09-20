# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# End of lines added by compinstall

autoload -U zmv

alias ls="ls -lah --color"
alias grep="grep --color"
alias make="/usr/bin/make -j 8"

if ! type hx > /dev/null; then
  # Arch Linux installs helix as 'helix'.
  alias hx=helix
fi

PROMPT='%2~ %(?.%F{green}%(!.&.*).%F{red}!)%f '

function backup() {
  tar -acvf "$(basename -- "$1") $(date +%F).tar.zst" "$@"
}

if (( $+commands[doctl] )); then
  eval $(doctl completion zsh)
fi

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

if [[ "$(uname)" == "Darwin" ]]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby
fi
  
