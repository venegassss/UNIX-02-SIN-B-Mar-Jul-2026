#!/bin/bash 
set -x
touch test && touch test123

(ls; ps)

ls; ps; whoami

lzl || echo "el comando lzl fallo"
echo 1 > archivo.txt
cat archivo.txt
echo 11 >> archivo.txt
cat archivo.txt
echo 11 >> archivo.txt
cat archivo.txt

set +x