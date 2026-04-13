# Options of a command (short/long)
# Command:
ls
# Arguments: 
-a  
#Show all files, including hidden ones.
--all  
#It does exactly the same thing as -a. It's the long version of the option.
-a /  
#List all contents of the root directory, including hidden files.
ls -l
#List of files in detailed format (permissions, owner, size, and date)
ls -l -ah
#detailed list including hidden and legible sizes
ls -lah
#Same as the previous one, but with options combined into a single form
mkdir -- -rf
#mkdir -- -rf → creates a directory literally named -rf (the -- prevents it from being taken as an option)
rm -- -r
#In one line: try to delete a file named -rf, treating that name as an argument and not as options.
rmdir -- -rf
#Try deleting a directory called -rf but only works if it's empty