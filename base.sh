#!/bin/bash

# Go

echo "Away"

sudo sed -i "s/ClientAliveInterval 0/ClientAliveInterval 0/g" /etc/ssh/sshd_config
sudo sed -i "s/ClientAliveCountMax 3/ClientAliveCountMax 0/g" /etc/ssh/sshd_config
sudo service ssh restart

echo "Gone now."
