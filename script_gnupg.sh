# Check if GnuPG is installed on the system
which gpg
# Result: shows the path where the gpg program is installed (for example /usr/bin/gpg)

# Display the installed GnuPG version and supported algorithms
gpg --version
# Result: prints version information and configuration details of GPG

# Generate a new GPG key pair (public and private key)
gpg --full-generate-key
# Result: creates a new key pair and stores it in the local GPG keyring

# List all public keys stored in the keyring
gpg --list-keys
# Result: displays all public keys available in your system

# List all secret (private) keys with long key IDs
gpg --list-secret-keys --keyid-format=long
# Result: shows private keys along with their long identification numbers

# Export your public key in ASCII armored format for sharing
gpg --armor --export cristopheribujes@gmail.com
# Result: prints the public key in readable text format

# Import your partner's public key into your keyring
gpg --import partner_public_key.asc
# Result: adds the partner's public key to your local keyring

# Verify that the key was imported successfully
gpg --list-keys
# Result: shows the list of keys including the imported partner key

# Create a plaintext file containing a secret message
echo "este mensaje esta cifrado por V3N3G4S" > doc_no_cifrado.txt
# Result: creates the file doc_no_cifrado.txt with the message inside

# Encrypt the file using your partner's public key
gpg --encrypt --recipient israelfarfan99@gmail.com doc_no_cifrado.txt
# Result: creates an encrypted file called doc_no_cifrado.txt.gpg

# Decrypt an encrypted file using your private key
gpg --decrypt doc_cifradoif.txt
# Result: decrypts the file and prints the original message to the terminal

# Sign the file in clear text format (content remains readable)
gpg --clearsign doc_no_cifrado.txt
# Result: creates a signed file called doc_no_cifrado.txt.asc

# Create a detached signature file
gpg --detach-sign doc_no_cifrado.txt
# Result: generates a separate signature file doc_no_cifrado.txt.sig

# Sign the file in binary format
gpg --sign doc_no_cifrado.txt.gpg
# Result: creates a binary signed file doc_no_cifrado.txt.gpg

# Verify a signed file
gpg --verify doc_no_cifradoif.txt.gpg
# Result: verifies the signature and shows if it is valid

# Verify a signed file
gpg --verify doc_no_cifrado_clearsign.txt.gpg.asc
# Result: verifies the signature and shows if it is valid

# Verify a signed file
gpg --verify doc_no_cifrado_detacha.txt.gpg.sig
# Result: verifies the signature and shows if it is valid

# Open the interactive menu to edit and manage a specific key
gpg --edit-key israelfarfan99@gmail.com
# Result: opens the GPG interactive interface where you can modify key settings

# Sign your partner's public key to certify it
gpg --sign-key israelfarfan99@gmail.com
# Result: adds your signature to your partner's public key

# Verify a signed file again after trusting the key
gpg --verify doc_no_cifrado_clearsign.txt.gpg.asc
# Result: the warning about an untrusted key may disappear