#!/usr/bin/env bash

# Perform system updates
echo "Updating package lists..."
sudo apt update

echo "Upgrading installed packages..."
sudo apt upgrade -y

# Install common development dependencies
echo "Installing common development dependencies..."

sudo apt-get install network-manager libnss3-tools jq xsel

# Essential build tools
sudo apt install -y build-essential

# Version control systems
sudo apt install -y git

# Text editors
sudo apt install -y vim

# Python development
sudo apt install -y python3 python3-pip

# Node.js development
# sudo apt install -y nodejs npm

# Database systems
sudo apt install -y mysql-server sqlite3

# Other useful tools
sudo apt install -y curl wget unzip

# Clean
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "System setup complete."

