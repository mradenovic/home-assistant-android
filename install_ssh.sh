#! /bin/bash
# This script sets ssh access in Termux

pkg upgrade -y
pkg install openssh -y
sshd
echo "Set password for user $USER."
passwd
echo "You can ssh into Termux with following commands:"
ifconfig | grep -oP 'inet .*?\K\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | while read line; do echo "ssh $USER@$line -p 8022"; done