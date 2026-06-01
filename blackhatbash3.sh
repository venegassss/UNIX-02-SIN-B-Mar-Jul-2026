#!/bin/bash
set -x

book="black hat bash"

echo "This book's name is ${book}"
#book="black hat bash"
    #Creates a variable called book and stores the text "black hat bash" inside it.

#echo "This book's name is ${book}"
    #Prints a sentence and inserts the value of the variable using ${book}.

echo "This book's name is $book"
#This prints a sentence and expands the variable book directly using $book.

root_directory=$(ls -ld /)
#stores detailed info about the root directory / in a variable.

echo "${root_directory}"
#prints that stored information

unset book
#removes the variable book from the current shell session, deleting its value so it no longer exists.


set +x