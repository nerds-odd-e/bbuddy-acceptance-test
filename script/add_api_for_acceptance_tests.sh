#!/bin/bash

API_FOLDER=$1

add_symlink() {
    SOURCE_FOLDER=$1
    if [ -z "$2" ]
    then
        TARGET_FOLDER=$SOURCE_FOLDER
    else
        TARGET_FOLDER=$2
    fi

    rm $TARGET_FOLDER
    ln -s $API_FOLDER/$SOURCE_FOLDER $TARGET_FOLDER
}

for subFolder in app bin config db lib log public Rakefile tmp config.ru; do
    add_symlink $subFolder
done

add_symlink Gemfile api_Gemfile

