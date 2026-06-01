#!/bin/bash
#!/bin/bash -x
#tells the system to run the script using Bash and enables debug mode 
#(-x), which prints each command and its arguments as they are executed.
bash --version
env
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}
ps -e -f 
ps -ef
df --human-readable

./blackhatbash1.sh
#Runs the script directly using the interpreter specified in the shebang (#!/bin/bash).
bash -r blackhatbash1.sh
#Runs the script in Bash restricted mode, which limits certain commands and operations.