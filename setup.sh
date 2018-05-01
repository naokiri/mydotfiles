#!/bin/sh

#set -x
set -eu

BASEDIR=$(cd $(dirname $0) && pwd)

# emacs
if [ ! -d ~/.emacs.d ]; then
    echo "Setup emacs config"
    ln -s $BASEDIR/dot.emacs.d ~/.emacs.d
fi

# vim
if [ ! -f ~/.vimrc ]; then
    echo "Setup vim config"
    ln -s $BASEDIR/dot.vimrc ~/.vimrc
fi


# Check if a git config entry alreay contains the file and add to global config
#
# $1: git config entry name e.g. include.path
# $2: filename to add to git config
# 
git_config_add_once() {
    if [ -z "$1" -o -z "$2" ]; then
        echo "git_config_add_once call failed"
        exit 1
    fi

    ENTRY_NAME=$1
    TARGET_FILENAME=$2

    GIT_EXISTS_FLAG=0
    set +e
    GIT_INCLUDE_LIST=$(git config --global --get-all $ENTRY_NAME)
    set -e
    if [ -n "$GIT_INCLUDE_LIST" ]; then
        for GIT_INCLUDE_FILE in ${GIT_INCLUDE_LIST}; do
            if [ "$GIT_INCLUDE_FILE" = "$TARGET_FILENAME" ]; then
                GIT_EXISTS_FLAG=1
            fi
        done
    fi
    if [ $GIT_EXISTS_FLAG -eq 0 ]; then
        echo "Setup" $TARGET_FILENAME
        git config --global --add $ENTRY_NAME $TARGET_FILENAME
    fi
}


# gitconfig
git_config_add_once "include.path" "$BASEDIR/gitconfig"


# gitignore
git_config_add_once "core.excludesfile" "$BASEDIR/gitignore"

echo "Done!"
