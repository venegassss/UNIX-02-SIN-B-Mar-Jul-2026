# create a simple group
sudo groupadd desarrolladores
sudo groupadd -g 2000 operaciones #SPECIFIC GID
# system group
sudo groupadd --system servicios_web

#verify that they were created
grep "desarrolladores\|operaciones\|servicios_web" /etc/group

grep -E "desarrolladores\|operaciones\|servicios_web" /etc/group

#see main options
groupadd --help