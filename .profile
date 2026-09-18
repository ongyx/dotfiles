export EDITOR=hx
export DOTNET_CLI_TELEMETRY_OPTOUT=1

makeflags() {
  local jobs=""
  if [[ "$(uname)" = "Darwin" ]]; then
    jobs=$(sysctl -n hw.logicalcpu)
  else
    jobs=$(nproc)
  fi
  export MAKEFLAGS="-j$(jobs)"
  export CMAKE_BUILD_PARALLEL_LEVEL=jobs
}
makeflags

if [[ "$(uname)" = "Android" ]]; then
  setopt CHASE_LINKS

  # Hard links are not supported on Android.
  export UV_LINK_MODE=symlink
fi

if [[ "$(uname -r)" = *"WSL2" ]]; then
  export WSL_USER=$(echo $(whoami.exe) | tr -d '\r\n' | cut -d '\' -f 2)
  export WSL_HOME=/mnt/c/Users/$WSL_USER
  export GALLIUM_DRIVER=d3d12
fi

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
. "$HOME/.deno/env"

export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.dotnet/tools:$HOME/.steel/bin"

[ "$BASH" ] && source ~/.bashrc
