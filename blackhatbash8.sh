#!/bin/bash 
awk '{print $1,$2,$3}' log.txt
awk '{print $1}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt

awk '{print $1,$NF}' log.txt
awk '{print $NF}' log.txt

awk -F',' '{print $1}' example_csv.txt
head log.txt 10 #lines

grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt

grep "Godzilla" log.txt #I use grep, but the sed command only 
#modifies the output and doesn't change the file, therefore it doesn't display anything.
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "Godzilla" newlog.txt
#Now it works
sed 's/ //g' log.txt
sed 's/ //g' log.txt > newlog1.txt
cat newlog1.txt