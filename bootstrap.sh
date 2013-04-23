#! /usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_DIR=~

dotfiles=(bashrc inputrc screenrc vimrc vim ctags)

for dotfile in ${dotfiles[@]}; do
    SRC=${SCRIPT_DIR}/${dotfile}
    TARGET=${TARGET_DIR}/.${dotfile}
    if [ -e $TARGET -o -d $TARGET ]; then
        echo "Target exists: $(ls -l $TARGET)"
    else
        ln -s $SRC $TARGET
        if [ $? -eq 0 ]; then
            echo "Created link $TARGET -> $SRC"
        fi
    fi
done

TARGET_BIN_DIR=${TARGET_DIR}/bin
SCRIPT_BIN_DIR=${SCRIPT_DIR}/bin
if [ ! -d ${TARGET_BIN_DIR} ]; then
    mkdir ${TARGET_BIN_DIR}
fi

for bin_file in $(ls bin); do
    SRC=${SCRIPT_BIN_DIR}/${bin_file}
    TARGET=${TARGET_BIN_DIR}/${bin_file}
    if [ -e $TARGET -o -d $TARGET ]; then
        echo "Target exists: $(ls -l $TARGET)"
    else
        ln -s $SRC $TARGET
        if [ $? -eq 0 ]; then
            echo "Created link $TARGET -> $SRC"
        fi
    fi
done

cd $SCRIPT_DIR
git config user.name "flakfizer"
git config user.email "flakfizerrt@gmail.com"

