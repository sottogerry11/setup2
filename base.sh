#!/bin/bash

# This script disables the timeout on the SSH server.

echo "Disabling timeout on SSH server..."

sudo sed -i "s/ClientAliveInterval 0/ClientAliveInterval 0/g" /etc/ssh/sshd_config
sudo sed -i "s/ClientAliveCountMax 3/ClientAliveCountMax 0/g" /etc/ssh/sshd_config
sudo service ssh restart

echo "Timeout on SSH server disabled."
