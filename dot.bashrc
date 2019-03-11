# -*- mode:shell-script(bash) -*-
# Sample bashrc, but default env for bash differs too much that I don't setup automatically.
shopt -s histappend
export HISTSIZE=1000
export HISTFILESIZE=2000

source ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
function _prompt_command () {
    history -a
    history -r
    __git_ps1 "[\[\033[36m\]\d \t\[\033[00m\]] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]" "\\\$ "
}
PROMPT_COMMAND='_prompt_command'

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

