export EDITOR=hx
export DOTNET_CLI_TELEMETRY_OPTOUT=1

setmakeflags() {
  local jobs=""
  if [[ "$(uname)" = "Darwin" ]]; then
    jobs=$(sysctl -n hw.logicalcpu)
  else
    jobs=$(nproc)
  fi
  export MAKEFLAGS="-j$(jobs)"
  export CMAKE_BUILD_PARALLEL_LEVEL=jobs
}
setmakeflags

if [[ "$(uname)" = "Android" ]]; then
  setopt CHASE_LINKS

  # Hard links are not supported on Android.
  export UV_LINK_MODE=symlink
fi

if [[ -x "$(command -v systemd-detect-virt)" && "$(systemd-detect-virt)" == "wsl" ]]; then
  export WSLUSER="$(echo $(whoami.exe) | tr -d '\r\n' | cut -d '\' -f 2)"
  export WSLHOME="/mnt/c/Users/$WSLUSER"
  export BROWSER="/mnt/c/Windows/explorer.exe"
  export GALLIUM_DRIVER=d3d12
  export LIBVA_DRIVER_NAME=d3d12
fi

if systemctl --user is-active ssh-agent.service > /dev/null; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/openssh_agent"
fi

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.dotnet/tools:$HOME/.steel/bin:$HOME/.rubies/ruby-4.0.7/bin"

[ "$BASH" ] && source ~/.bashrc
