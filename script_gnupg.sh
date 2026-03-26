# Check if GnuPG is installed on the system
which gpg
# Result: shows the path where the gpg program is installed (for example /usr/bin/gpg)

# Display the installed GnuPG version and supported algorithms
gpg --version
# Result: prints version information and configuration details of GPG

# Generate a new GPG key pair (public and private key)
gpg --full-generate-key
# Result: creates a new key pair and stores it in the local GPG keyring
