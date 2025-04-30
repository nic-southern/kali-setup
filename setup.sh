#!/bin/bash
# Nic's Kali Linux Setup Script

# Update package list
sudo apt update
sudo apt upgrade -y

# Install essential tools
sudo apt install -y docker.io 

# Move tmux.conf to home directory
mv tmux.conf ~/.tmux.conf

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Source tmux configuration
tmux source ~/.tmux.conf

# Copy reverse shells to /user/share/reverse-shells
mkdir -p /usr/share/reverse-shells
cp reverse-shells/* /usr/share/reverse-shells/

# Make all files in /usr/share/reverse-shells executable
chmod +x /usr/share/reverse-shells/*

# Extract rockyou.txt
gzip -d /usr/share/wordlists/rockyou.txt.gz

