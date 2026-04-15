echo '#!/bin/sh' > hola.sh
#Create hola.sh with the shebang (define that it uses /bin/sh)

echo 'echo "hola desde mi primer script"' >> hola.sh
#Add the command that will print the message

cat hola.sh
#displays the script contents