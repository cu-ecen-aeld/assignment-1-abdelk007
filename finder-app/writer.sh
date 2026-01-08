#!/bin/bash

# Check if supplied arguments are 2 
if [ "$#" -ne 2 ]; then
    echo "$# was provided while 2 is needed"
    exit 1
fi

touch $1 2> /dev/null

if [ "$?" -ne "0" ]; then
    echo "file couldn't be created! Creating Directory!"
    dirname $1 | xargs mkdir -p 
    if [ "$?" -ne "0" ]; then
        echo "Couldn't create directory!"
        touch $1
        if [ "$?" -ne "0" ]; then
            echo "Still Couldn't create directory!"
            exit 1
        fi  
    fi
fi

echo $2 > $1