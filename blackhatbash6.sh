#!/bin/bash 
set -x
ls -l / | grep "bin"
SCRIPT_NAME="$(0)"
TARGET="$(1)"

echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping "${TARGET}"



set +x

