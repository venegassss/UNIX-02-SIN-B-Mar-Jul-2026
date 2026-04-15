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

ls /etc
#It does not use sudo (only lists, does not modify anything

touch /etc/prueba.txt 
#You might need sudo (if /etc doesn't let you write). In that case, you should change permissions with chmod or run it with sudo.

mkdir ~/mi_carpeta
#It doesn't use sudo (it's my personal folder)

apt install cowsay
#It usually uses sudo (to install software on the system)