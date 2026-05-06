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

#View the range of GIDs in the system
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs

#ubuntu
SYS_MIN = 100
SYS_MAX = 999
GID_MIN = 1000
GID_MAX = 60000
