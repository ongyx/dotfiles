case $- in
    *i*) ;;
      *) return;;
esac

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s globstar

alias ls="ls -lah --color"
alias grep="grep --color"

# https://stackoverflow.com/a/1703567
_COLOR_BLACK=$(tput setaf 0)
_COLOR_RED=$(tput setaf 1)
_COLOR_GREEN=$(tput setaf 2)
_COLOR_LIME_YELLOW=$(tput setaf 190)
_COLOR_YELLOW=$(tput setaf 3)
_COLOR_POWDER_BLUE=$(tput setaf 153)
_COLOR_BLUE=$(tput setaf 4)
_COLOR_MAGENTA=$(tput setaf 5)
_COLOR_CYAN=$(tput setaf 6)
_COLOR_WHITE=$(tput setaf 7)
_COLOR_BRIGHT=$(tput bold)
_COLOR_NORMAL=$(tput sgr0)
_COLOR_BLINK=$(tput blink)
_COLOR_REVERSE=$(tput smso)
_COLOR_UNDERLINE=$(tput smul)

PROMPT_COMMAND=$(
cat <<EOF
if [ $? == 0 ]; then
  _PROMPT_SYM="*"
  _PROMPT_COLOR="${_COLOR_GREEN}"
else
  _PROMPT_SYM="!"
  _PROMPT_COLOR="${_COLOR_RED}"
fi
EOF
)

export PS1='\H \w \[${_PROMPT_COLOR}\]$_PROMPT_SYM\[${_COLOR_NORMAL}\] '

backup() {
  tar -acvf "$(basename -- "$1") $(date +%F).tar.zst" "$@"
}

if [[ -x "$(command -v doctl)" ]]; then
  eval $(doctl completion bash)
fi

if [[ -x "$(command -v systemd-detect-virt)" ||  "$(systemd-detect-virt)" == "wsl" ]]; then
  export LIBVA_DRIVER_NAME=d3d12
  export BROWSER='/mnt/c/Windows/explorer.exe'
fi

source /home/ongyx/.local/share/bash-completion/completions/deno.bash
