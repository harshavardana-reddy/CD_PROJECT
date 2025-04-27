#!/bin/bash

# Exit on any error
set -e

# Update the system
sudo yum update -y

# Install Docker
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
sudo yum install -y libxcrypt-compat
# Install Docker Compose (latest v1.29.2)
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



# Install Git
sudo yum install -y git
# Install dos2unix
sudo yum install -y dos2unix

# Install Node.js 18.x
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

sudo reboot