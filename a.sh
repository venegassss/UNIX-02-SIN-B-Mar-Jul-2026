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