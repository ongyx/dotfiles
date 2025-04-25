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

if ! type hx > /dev/null; then
  # Arch Linux installs helix as 'helix'.
  alias hx=helix
fi

PROMPT='%2~ %(?.%F{green}%(!.&.*).%F{red}!)%f '

function backup() {
  tar -acvf "$(basename -- "$1") $(date +%F).tar.zst" "$@"
}

export EDITOR=hx
export MAKEFLAGS="-j$(nproc)"
export CMAKE_BUILD_PARALLEL_LEVEL=8

# uv
export PATH="$PATH:$HOME/.local/bin"

# go
export PATH="$PATH:$HOME/go/bin"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# netcoredbg (fedora doesn't have a package for it lol)
export PATH="$PATH:$HOME/.local/share/netcoredbg"

if [[ "$(uname -o)" = "Android" ]]; then
  setopt CHASE_LINKS

  # Hard links are not supported on Android.
  export UV_LINK_MODE=symlink

  # Start SSH agent.
  sv-enable ssh-agent
  export SSH_AUTH_SOCK="$PREFIX/var/run/ssh-agent.socket"
else
  # dotnet
  export PATH="$PATH:$HOME/.dotnet/tools"

  # godot
  export GODOT="$HOME/.config/godotenv/godot/bin/godot"
  export PATH="$PATH:$HOME/.config/godotenv/godot/bin"

  if [[ "$(uname -r)" = *"WSL2" ]]; then
    export WSL_USER=$(echo $(whoami.exe) | tr -d '\r\n' | cut -d '\' -f 2)
    export WSL_HOME=/mnt/c/Users/$WSL_USER
    export GALLIUM_DRIVER=d3d12
  fi

  # Start SSH agent. This assumes ssh-agent.service is enabled.
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

if (( $+commands[doctl] )); then
  eval $(doctl completion zsh)
fi

ssh-add
