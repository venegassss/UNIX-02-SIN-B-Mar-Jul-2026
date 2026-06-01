#!/bin/bash
set -x
# Create directory
mkdir mydirectory

# Create file
touch mydirectory/myfile

# List contents
ls -l mydirectory


#bash -x blackhatbash2.sh
#Runs the script in debug mode. It prints each command before executing it, so you see step-by-step execution of the script.

#bash -r blackhatbash1.sh
#Runs the script in restricted mode, where certain actions are blocked (like changing directories, modifying PATH, 
#or running some system commands). It does not show extra output by itself—just runs the script with limitations.

#bash -n blackhatbash1.sh
#Checks the script for syntax errors only without executing it. It does not run any commands, just validates the script structure.


set +x