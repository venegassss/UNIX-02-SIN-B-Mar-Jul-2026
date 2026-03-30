// Updates the package lists from repositories.
    sudo apt update
//Shows repository URLs, fetched data, and package list status.

//Upgrades installed packages to newer versions.
    sudo apt upgrade
//Shows packages to be upgraded, download size, and installation progress.

//Installs the parted disk partitioning tool.
sudo apt install parted
//Shows dependencies, required space, and installation progress/output.

//Displays partition information (parted), then separates with "--", and afterwards lists the disks with their file systems (lsblk -f)
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e

//Check if the system is booted in UEFI mode or BIOS mode.
//If the /sys/firmware/efi directory exists, it prints "UEFI"; otherwise, it prints "BIOS".
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"

//creates a file with that text, and stat archivo.txt shows its metadata (size, permissions, timestamps, inode, etc.).
echo "esto es un archivo" > archivo.txt
stat archivo.txt