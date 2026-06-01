#!/bin/bash 
set -x

PUBLISHER="No Starch Press" 
print_name(){ 
    local name 
    name="Black Hat Bash" 
    echo "${name} by ${PUBLISHER}" 
    } 
print_name 

echo "Variable ${name} will not be printed because it is a local variable."

#This script defines a global variable (PUBLISHER) and a function (print_name) 
#that creates a local variable (name) and prints both together. The function is then executed, 
#and afterwards the script tries to access the local variable outside its scope.
set +x