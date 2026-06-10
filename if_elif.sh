#!/bin/bash

USER_INPUT="${1}"

# 1
if [[ -z "${USER_INPUT}" ]]; then #The `-z` function checks if the variable is empty.If no argument is provided, 
#it displays a message and terminates the script.
    echo "You must provide an argument!"
    exit 1
fi

# 2
if [[ -f "${USER_INPUT}" ]]; then #-f returns true if a regular file exists.
    # 3
    echo "${USER_INPUT} is a file"
elif [[ -d "${USER_INPUT}" ]]; then #If it's not a file, check if it's a directory using -d.
    echo "${USER_INPUT} is a directory"
else    #If it's neither a file nor a directory, it displays the message "${USER_INPUT} is not a file or a directory".
    # 4
    echo "${USER_INPUT} is not a file or a directory"
fi