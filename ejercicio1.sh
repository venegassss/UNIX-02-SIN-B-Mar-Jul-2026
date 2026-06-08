#!/bin/bash

nombre=$1
apellido=$2

date +"%d-%m-%Y" > output.txt

echo "$nombre $apellido" >> output.txt

cp output.txt backup.txt

cat output.txt