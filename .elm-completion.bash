#/usr/bin/env bash

_elm()
{
    COMPREPLY=()
    
    local COMMANDS=("repl" "init" "reactor" "make" "install" "bump" "diff" "publish")
    
    declare -A ACTIONS
    ACTIONS[repl]="--interpreter= --no-colors"
    ACTIONS[init]=""
    ACTIONS[reactor]="--port="
    ACTIONS[make]="--debug --optimize --output= --report= --docs="
    ACTIONS[install]=""
    ACTIONS[bump]=""
    ACTIONS[diff]=""
    ACTIONS[publish]=""
    
    local cur=${COMP_WORDS[COMP_CWORD]}
    
    if [ ${ACTIONS[$3]+1} ] ; then
        COMPREPLY=( `compgen -W "${ACTIONS[$3]}" -- $cur` )
        
    else
        COMPREPLY=( `compgen -W "${COMMANDS[*]}" -- $cur` )
    fi
}

complete -F _elm elm