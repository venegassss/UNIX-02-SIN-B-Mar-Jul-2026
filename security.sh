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

#in ubuntu
SYS_MIN = 100
SYS_MAX = 999
GID_MIN = 1000
GID_MAX = 60000

#create groups with addgroups
sudo addgroup diseno
sudo addgroup --gid 2100 marketing
sudo addgroup --system cache_web
#verify
grep "diseno\|marketing\|cache_web" /etc/group

#see groups
groups
id
#add user with usermod
sudo usermod -aG desarrolladores root
sudo usermod -aG diseno root

#verify changes in /etc/groups
grep "diseno\|desarrolladores" /etc/group
#add user with adduser
sudo adduser root marketing
#see state
id root
grep root /etc/group

#now the error
sudo usermod -G desarrolladores root
# this delete all secondary groups except desarrrolladores
id root #He lost all the other groups