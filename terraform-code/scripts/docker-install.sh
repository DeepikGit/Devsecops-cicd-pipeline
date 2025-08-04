#!/bin/bash

# Update system packages
sudo yum update -y

# Install Docker
sudo amazon-linux-extras install docker -y
sudo yum install -y docker

# Start Docker service
sudo service docker start

# Enable Docker on boot
sudo systemctl enable docker

# Add ec2-user to docker group (so you can run docker without sudo)
sudo usermod -aG docker ec2-user

# Optional: Print Docker version to confirm installation
docker --version > /home/ec2-user/docker_version.txt

# (Optional) Add basic logging for troubleshooting
echo "Docker installed and started successfully" > /home/ec2-user/docker_setup_log.txt
