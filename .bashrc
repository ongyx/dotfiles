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

PROMPT_COMMAND='if [ $? = 0 ]; then _PROMPT_SYM="\033[32m*\033[m"; else _PROMPT_SYM="\033[31m!\033[m"; fi'
export PS1='\H \w $(echo -ne $_PROMPT_SYM) '

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
