#!/bin/bash

# Check if exactly 2 arguments were provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <name> <domain>"
    exit 1
fi

# Store command-line arguments
NAME=$1
DOMAIN=$2

# Send one ping packet to the target domain
ping -c 1 "$DOMAIN" > /dev/null 2>&1

# Check whether the ping succeeded
if [ $? -eq 0 ]; then
    RESULT="Success"
else
    RESULT="Failure"
fi

# Get current date and time
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Append the result to a CSV file
echo "$NAME,$DOMAIN,$RESULT,$CURRENT_DATE" >> results.csv

# Display the result on screen
echo "Ping result for $DOMAIN: $RESULT"

#chmod +x exercise_solution.sh
#./exercise_solution.sh mysite google.com 