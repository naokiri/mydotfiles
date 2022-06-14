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
    xterm*|rxvt*)
        SET_TERM_TITLE=1
        ;;
    *)
        ;;
esac

PS_STRING_BEFORE="[\[\033[36m\]\D{%Y-%m-%d} \t\[\033[00m\]] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]"
PS_STRING_AFTER="\\\$ "    
if [ $SET_TERM_TITLE -eq 1 ]; then
    #PS_STRING_BEFORE="[\[\033[36m\]\D{%Y-%m-%d} \t\[\033[00m\]] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\[\e]0;\]\W\a\[\033[00m\]"
    PS_STRING_AFTER="\\\$\[\e]0;\W\a\] "    
fi

function _prompt_command () {
    _multiwindow_history_sync
    __git_ps1 "$PS_STRING_BEFORE" "$PS_STRING_AFTER"
}
PROMPT_COMMAND='_prompt_command'

export LESS="--LONG-PROMPT --RAW-CONTROL-CHARS --no-init"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

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

