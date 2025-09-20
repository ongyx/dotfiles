export EDITOR=hx
export JEKYLL_EDITOR=code
export DOTNET_CLI_TELEMETRY_OPTOUT=1

function () {
  local jobs=""
  if [[ "$(uname)" = "Darwin" ]]; then
    jobs=$(sysctl -n hw.logicalcpu)
  else
    jobs=$(nproc)
  fi
  export MAKEFLAGS="-j$(jobs)"
  export CMAKE_BUILD_PARALLEL_LEVEL=jobs
}

# uv
export PATH="$PATH:$HOME/.local/bin"

# go
export PATH="$PATH:$HOME/go/bin"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# netcoredbg (fedora doesn't have a package for it lol)
export PATH="$PATH:$HOME/.local/share/netcoredbg"

if [[ "$(uname)" = "Darwin" ]]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

if [[ "$(uname)" = "Android" ]]; then
  setopt CHASE_LINKS

  # Hard links are not supported on Android.
  export UV_LINK_MODE=symlink
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
fi
