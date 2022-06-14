# -*- mode:shell-script(bash) -*-
# Sample bashrc, but default env for bash differs too much that I don't setup automatically.
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=20000

source ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
function _multiwindow_history_sync () {
    history -a
    history -c
    history -r
}

SET_TERM_TITLE=0
case "$TERM" in
    xterm*|rxvt*|dtterm*|aixterm*)
        SET_TERM_TITLE=1
        ;;
    *)
        # have to consult on manuals to find other term title escape sequences.
        ;;
esac

text_reset=$(tput sgr0)
text_bold=$(tput bold)
fcolor_red=$(tput setaf 1)
fcolor_green=$(tput setaf 2)
fcolor_blue=$(tput setaf 4)
fcolor_cyan=$(tput setaf 6)

PS_STRING_BEFORE="[\[$fcolor_cyan\]\D{%Y-%m-%d} \t\[\$text_reset\]] \[$text_bold$fcolor_green\]\u@\h\[$text_reset\]:\[$text_bold$fcolor_blue\]\W\[$text_reset\]"
PS_STRING_AFTER="\\\$ "    
if [ $SET_TERM_TITLE -eq 1 ]; then
    PS_STRING_AFTER="\\\$\[\e]0;\W\a\] "    
fi

function _prompt_command () {
    _multiwindow_history_sync
    __git_ps1 "$PS_STRING_BEFORE" "$PS_STRING_AFTER"
}
PROMPT_COMMAND='_prompt_command'

export LESS="--LONG-PROMPT --RAW-CONTROL-CHARS --no-init"
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) 
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white and underline
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

function _is_updated_today() {
    local last_update=$(date +%s -r "$1")
    local today_am4=$(date +%s --date="4AM")
    [ ${last_update} -ge ${today_am4} ]
}

function _daily_check_hook() {
    local previous_exit_status=$?;
    local config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
    local touch_file="${config_dir}/.daily_script"
    if [ -e ${touch_file} ]; then
        if ! _is_updated_today ${touch_file}; then
            echo "daily script waiting" >&2
        fi
    else
        echo "foo"
    fi
    return ${previous_exit_status};
}

