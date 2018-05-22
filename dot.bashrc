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

