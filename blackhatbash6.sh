#!/bin/bash

set -x

SCRIPT_NAME="$0"
TARGET="$1"

echo "Running the script $SCRIPT_NAME ..."
echo "Pinging the target: $TARGET ..."

ping -c 3 "$TARGET"

echo "the arguments are: $0"
echo "the total number of arguments is: $#"

for args in "$0"; do
    echo "${args}"
done
set +x