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

# gitconfig
GIT_TARGET_FILE="$BASEDIR/gitconfig"
GIT_DONE=0
set +e
GIT_INCLUDE_LIST=$(git config --global --get-all include.path)
set -e
if [ "$GIT_INCLUDE_LIST" != "" ]; then
    for GIT_INCLUDE_FILE in ${GIT_INCLUDE_LIST}; do
        if [ "$GIT_INCLUDE_FILE" = "$GIT_TARGET_FILE" ]; then
            GIT_DONE=1
        fi
    done
fi
if [ $GIT_DONE -eq 0 ]; then
    echo "Setup gitconfig"
    git config --global --add include.path "$BASEDIR/gitconfig"
fi

echo "Done!"
