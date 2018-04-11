#!/bin/sh

#set -x
set -eu

BASEDIR=$(cd $(dirname $0) && pwd)

# emacs
if [ ! -d ~/.emacs.d ]; then
    echo "Setup emacs config"
    ln -s $BASEDIR/dot.emacs.d ~/.emacs.d
fi

# gitconfig
GIT_TARGET_FILE="$WD/gitconfig"
GIT_DONE=0
GIT_INCLUDE_LIST=$(git config --global --get-all include.path)
for GIT_INCLUDE_FILE in ${GIT_INCLUDE_LIST}; do
    if [ "$GIT_INCLUDE_FILE" = "$GIT_TARGET_FILE" ]; then
        GIT_DONE=1
    fi
done
if [ $GIT_DONE -eq 0 ]; then
    echo "Setup gitconfig"
    git config --global --add include.path "$BASEDIR/gitconfig"
fi

echo "Done!"
