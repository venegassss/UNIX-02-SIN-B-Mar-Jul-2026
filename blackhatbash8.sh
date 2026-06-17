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

sed '1d' log.txt
sed '1d' log.txt > newlogd.txt
cat newlogd.txt

sed '$d' log.txt
sed '$d' log.txt > newlogl.txt
cat newlogd.txt

sed '5,7d' newlog.txt > newlog57.txt
cat newlog57.txt

sed -n '2,15 p' log.txt
sed -i '1d' log.txt

sleep 100 & #Run sleep in the background for 100 seconds
ps -ef | grep sleep # Show running processes and filter for "sleep"
jobs #List current background jobs

fg %1 # Bring job 1 to the foreground
bg %1 # Resume job 1 in the background
kill -9 <1>   # Forcefully terminate the process with the specified PID (1)

nohup ./blackhatbash8.sh & # Run the script in the background and keep it running after logout

sleep 500 &