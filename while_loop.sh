#!/bin/bash

SIGNAL_TO_STOP_FILE="stoploop" #Sets a variable with the filename stoploop.

while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do  #The while loop keeps checking every 2 seconds until the file stoploop exists, then it stops.
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
    echo "Checking again in 2 seconds..."
    sleep 2
done

echo "File was found! exiting..." #End of the loop.