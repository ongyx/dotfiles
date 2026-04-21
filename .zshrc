# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep extendedglob nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# End of lines added by compinstall

autoload -U zmv

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

alias ls="ls -lah --color"
alias grep="grep --color"
alias make="/usr/bin/make -j 8"

if ! type hx > /dev/null; then
  # Arch Linux installs helix as 'helix'.
  alias hx=helix
fi

PROMPT='%2~ %(?.%F{green}%(!.&.*).%F{red}!)%f '
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

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

if [[ (( $+commands[systemd-detect-virt] )) ||  "$(systemd-detect-virt)" == "wsl" ]]; then
  export GALLIUM_DRIVER=d3d12
  export LIBVA_DRIVER_NAME=d3d12
fi
