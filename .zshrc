autoload -Uz compinit
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s:%b)'
zstyle ':vcs_info:*' action formats '(%s:%b|%a)'
precmd (){
        psvar=()
        LANG=en_US.UTF8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
compinit
# End of lines added by compinstall
# Prompt setting
case ${UID} in
0)
    PROMPT="%{^[[31m%}%n%%%{^[[m%} "
    RPROMPT="[%~]"
    PROMPT2="%B%{^[[31m%}%_#%{^[[m%}%b "
    SPROMPT="%B%{^[[31m%}%r is correct? [n,y,a,e]:%{^[[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{^[[31m%}%n%%%{^[[m%} "
    RPROMPT="[%~]"
    PROMPT2="%{^[[31m%}%_%%%{^[[m%} "
    SPROMPT="%{^[[31m%}%r is correct? [n,y,a,e]:%{^[[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac
RPROMPT="%1(v|%F{green}%1v%f|)${RPROMPT}"
