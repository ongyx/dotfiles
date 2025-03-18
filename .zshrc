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

setopt RE_MATCH_PCRE
source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

alias ls="ls -lah --color"
alias grep="grep --color"
alias make="/usr/bin/make -j 8"

PROMPT='%2~ %(?.%F{green}%(!.&.*).%F{red}!)%f '

if [[ -f /run/.containerenv ]]; then
  source /run/.containerenv
  PROMPT="$container:$name $PROMPT"
fi

function tbx() {
  if (( ${+container} )); then
    echo "Already in a container."
  else
    toolbox enter
  fi
}

export EDITOR=hx
export MAKEFLAGS="-j$(nproc)"
export CMAKE_BUILD_PARALLEL_LEVEL=8

# uv
export PATH="$PATH:$HOME/.local/bin"

# go
export PATH="$PATH:$HOME/go/bin"

if [[ "$(uname -o)" = "Android" ]]; then
  setopt CHASE_LINKS

  # Hard links are not supported on Android.
  export UV_LINK_MODE=symlink

  # Start SSH agent.
  source "$(which source-ssh-agent)"
else
  # dotnet
  export PATH="$PATH:$HOME/.dotnet/tools"

  # godot
  export GODOT="$HOME/.config/godotenv/godot/bin/godot"
  export PATH="$PATH:$HOME/.config/godotenv/godot/bin"
fi

if (( $+commands[doctl] )); then
  eval $(doctl completion zsh)
fi
