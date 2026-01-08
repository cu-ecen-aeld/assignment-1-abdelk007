#!/bin/bash

# Check if supplied arguments are 2 
if [ "$#" -ne 2 ]; then
    echo "$# was provided while 2 is needed"
    exit 1
fi

# check if directory exists
if ! [ -d "$1" ]; then
    echo "$1 isn't a directory!!"
    exit 1
fi

NUMBER_OF_FILES=$(ls -alLR $1 | grep -e '^-' | wc -l)
NUMBER_OF_LINES=$(grep -r $2 $1 | wc -l)
printf "The number of files are %s and the number of matching lines are %s\n" "$NUMBER_OF_FILES" "$NUMBER_OF_LINES"