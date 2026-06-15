#!/bin/bash

for ip_address in "$@"; do
    echo "Taking some action on IP address ${ip_address}"
done

#./for_ip.sh 10.0.0.1 10.0.0.2 192.168.1.1 192.168.1.2


for file in $(/.*); do
    echo "File: ${file}"
done