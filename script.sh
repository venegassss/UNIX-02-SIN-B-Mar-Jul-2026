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

ls --help
#It shows quick help with options and usage of the ls command

man ls
#Open the complete and detailed ls manual in the terminal.
# Basic navigation in the manual
#   ↓ or j → go down one line
#   ↑ or k → go up one line
#   Space → go down one page
#   b → go up one page
#   g → go to the beginning of the document
#   G → go to the end of the document
#   Searching within the manual
#   /text → search for a word
#   n → next match
#   N → previous match

man git-clone
#Open the git clone manual page (if it exists on your system) to view its documentation.
/depth
#Search for the word "depth" in the git clone manual and it will take you to the first match.

chmod +x script.sh
#Adds execute permission to everyone (user, group, and others) in script.sh.
chmod u+x script.sh
#Adds execution permission only to the file owner (u = user).
chmod o-r secreto.txt
#Remove read permission from other users (o = others) in secret.txt.
chmod u+rw,go-rwx privado
#It does two things:
    #u+rw → the owner can read and write
    #go-rwx → the group and others have no permissions (no read, no write, no execute)

sudo echo "hola" > /etc/archivo_protegido
#bash: /etc/archivo_protegido: Permission denied
#Because sudo only applies to the echo command, but the redirection 
#(>) is done by your unprivileged shell, so it doesn't have permission to write to /etc.

echo "hola" | sudo tee /etc/archivo_protegido > /dev/null
#Write "hello" to /etc/protected_file with administrator permissions and 
#nothing is displayed on the screen (because it redirects to /dev/null).

echo "hola" | sudo tee /etc/archivo_protegido 
#Write "hello" in /etc/protected_file with administrator permissions and display it on the screen.