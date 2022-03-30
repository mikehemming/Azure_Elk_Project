#!/bin/bash

#Ensure apt has all availabe updates
apt update -y

# Updgrades all installed packages
apt update -y

# Install new packages, and uninstall any old packages
# must be removed to install them
apt full-upgrade -y

# Remove unused  packages and their associated configuration files
apt autoremove --purge -y

# Bonus
apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y