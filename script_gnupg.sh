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