[[ $- != *i* ]] && return

COLOR1='\033[1;37m'
COLOR2='\033[1;97m'
RESET='\033[0m'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1="${COLOR1}[ ${COLOR2}\w${COLOR1} ] ${COLOR1}\033[5m>> ${RESET}"
