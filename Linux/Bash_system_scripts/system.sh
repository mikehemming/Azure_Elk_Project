#!/bin/bash
# This script contains various tools to determine the status of the system.

# Outputs current system free memory to free_mem.txt
free -h > ~/backups/freemem/free_mem.txt

# Outputs current disk usage to disk_usage.txt
du -h > ~/backups/diskuse/disk_use.txt

# Outputs all open files to open_list.txt
lsof -e /run/user/1000/gvfs > ~/backups/openlist/open_list.txt

# Outputs File system disk space usage to free_disk.txt
df -h > ~/backups/freedisk/free_disk.txt
