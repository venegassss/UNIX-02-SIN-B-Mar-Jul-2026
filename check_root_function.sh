#!/bin/bash
check_if_root(){ #Declares a new function named check_if_root. 
#The parentheses () indicate it's a function definition, and the curly brace { opens the function's body.

    if [[ "$(ID -u)" -eq "0" ]]; then #Runs a conditional check. $(id -u) executes the id -u command 
    #(which prints the current user's numeric user ID) and captures its output. The [[ ... ]] 
    #test then checks if that value is equal (-eq) to 0, which is the UID of the root user. 

          return 0 #If the user is root, the function returns 0 — which in shell scripting means success.

      else  #If the user is not root, the function returns 1 — which means failure.
          return 1
      fi  
  }

is_root=$(check_if_root) #Calls the check_if_root function and stores its return value 
#(the text it prints to standard output) into the variable is_root.
if [[ "$is_root" -eq "0" ]]; then  #Tests whether the variable is_root is numerically equal to 0.
      echo "user is root!"  #If the value is 0, prints the message that the user is root.
  else
      echo "user is not root!"  #Otherwise, prints that the user is not root.
  fi  

  # sudo useradd pepebotellas
  # sudo passwd pepebotellas
  # su - pepebotellas
  #
  #
  #
  #