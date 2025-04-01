#! /bin/bash
# This script sets ssh access in Android Native Terminal (AVF)

sudo apt update && sudo apt upgrade -y
sudo apt install -y openssh-server
sudo sed -i 's/#Port 22/Port 8022/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "Set password for user $USER."
sudo passwd $USER
echo "You can ssh into Native Linux Terminal with following commands:"
ip addr | grep -oP 'inet .*?\K\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | while read line; do echo "ssh $USER@$line -p 8022"; done