# uv
export PATH="$PATH:$HOME/.local/bin"

# bun
export PATH="$PATH:$HOME/.bun/bin"

# go
export PATH="$PATH:$HOME/go/bin"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# dotnet
export PATH="$PATH:$HOME/.dotnet/tools"

# vscode on macOS
if [[ "$(uname)" = "Darwin" ]]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi
