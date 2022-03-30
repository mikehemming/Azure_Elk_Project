#!/bin/bash

# Create /var/backup if it doesn't exist
mkdir -p /var/backup

# Create new /var/backup/home.tar
tar cvf /var/backup/home.tar /home

# Moves the file
mv /var/backup/home.tar /var/backup/home.12041983.tar

# List all files in  /var/backup and save output to file_report.txt
ls -lah /var/backup >> /var/backup/file_report .txt

# Print how much free memory your machine has left.
free -h >> /var/backup/disk_report.txt