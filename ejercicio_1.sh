echo '#!/bin/sh' > hola.sh
#Create hola.sh with the shebang (define that it uses /bin/sh)

echo 'echo "hola desde mi primer script"' >> hola.sh
#Add the command that will print the message

cat hola.sh
#displays the script contents

./hola.sh
#Run the script (if you have execute permissions)
#In our case we don't have permission, so it deploys bash: ./hola.sh: Permission denied

#To obtain permissions, we execute:
chmod +x hola.sh
#It gives execution permission to the file so that it can be run as a program (./hola.sh).