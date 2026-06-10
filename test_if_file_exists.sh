#!/bin/bash

FILENAME="flow_control_with_if_1.txt"

if [ ! -f "${FILENAME}" ]; then
    touch "${FILENAME}"
fi