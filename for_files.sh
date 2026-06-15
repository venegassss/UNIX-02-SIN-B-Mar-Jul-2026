#!/bin/bash

# Start a loop that iterates through all files whose names
# begin with "example_file * (we use the asterisk to indicate all the files that start with 'example_file')"
for file in example_file*; do

    # Check if the current file is "example_file1"
    if [[ "${file}" == "example_file1" ]]; then

        # Display a message indicating that the first file will be skipped
        echo "Skipping the first file..."

        # Skip the rest of the current iteration and move to the next file in the loop
        continue
    fi

    # Write a random number to the current file,
    # replacing any existing content
    echo "${RANDOM}" > "${file}"

# End of the loop
done