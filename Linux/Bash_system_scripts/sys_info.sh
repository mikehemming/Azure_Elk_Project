#!/bin/bash

# check if script is being run as sudo

if [ $UID -eq 0 ]
then
 echo "Please do not run as sudo"
exit
fi

# variables needed later
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet| tail -3| head -1)
exe=$(find /home -type f -perm 777)

files=(
'/etc/passwd'
'/etc/shadow'
)

# make sure /research directory is intact
if [ ! -d $HOME/research ]
then
  mkdir $HOME/research\
fi

# clear out existing sys_info.txt and create new empty folder
if [ -f $output ]
then
  > $output
fi
############################################################
# script start

# report title
echo "System Info" >> $output

# today's date
date >> $output

# prints out system information 
echo -e "\nUname info: \n$(uname -a) \n" >> $output

# Prints out system current IP
echo -e "IP info: $(hostname -I)" >> $output

# Alternate way of printing IP
echo $ip >> $output

# Prints Machine information
echo "Machine type: $MACHTYPE" >> $output

# Prints name of host
echo "Hostname: $(hostname -s) " >> $output

# Prints DNS information
echo "DNS Servers:" >> $output
cat /etc/resolv.conf >> $output

# Prints current memory usaga
echo -e "\nMemory Info:" >> $output
free -h >> $output

# Prints current cpu usage
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output

# Prints current disk utilization
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

# Prints list of currently logged in users
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output

# Prints list of all files with universal access
echo $exe >> $output

# Prints current top ten processes by memory usage
ps aux --sort -%mem | head | awk {'print $1, $2, $3, $4, $11'} >> $output

# Check the permission on files
for file in ${Files[@]}
do
  ls -l $file >> $output
done

# Check the sudo priveleges for all users with a home directory
for user in $(ls /home)
do
  sudo -lU $user >> $output
done

endscript