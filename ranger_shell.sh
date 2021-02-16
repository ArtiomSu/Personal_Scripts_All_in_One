#!/usr/bin/env bash

# EXPL: simplify when r.shell -c $SHELL
if [[ $# == 2 && $1 == -c && ($2 == $SHELL || $2 == '$SHELL') ]]
then shift 2; fi

# EXPL: overwrite when SHELL=r.shell
[[ -x /usr/bin/zsh ]] \
&& export SHELL=/usr/bin/zsh

# USE: Interactive shell
(($#)) || exec ${SHELL:?}

# USE: Cmdline populated with aliases
[[ $1 != -c ]] || shift
exec ${SHELL:?} -c '
(( $(id -u) )) || HOME=/home/${SUDO_USER:-${USER:-${USERNAME:?}}}
source ~/.zsh_aliases
[[ ${SHELL:?} =~ zsh$ ]] && setopt aliases || shopt -s expand_aliases
eval "$@"
' "$0" "$@"