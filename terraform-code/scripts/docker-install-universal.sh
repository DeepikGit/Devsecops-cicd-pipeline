#!/bin/bash

# Detect OS
OS="$(uname -a)"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    DISTRO=$(echo "$OS" | awk '{print $1}')
fi

echo "Detected OS: $DISTRO" > /home/ec2-user/docker_os_detected.txt

# Install Docker based on OS
case "$DISTRO" in
    amzn)
        # Amazon Linux
        yum update -y
        amazon-linux-extras install docker -y
        yum install -y docker
        ;;
    ubuntu)
        apt-get update -y
        apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
        apt-get update -y
        apt-get install -y docker-ce docker-ce-cli containerd.io
        ;;
    debian)
        apt-get update -y
        apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
        apt-get update -y
        apt-get install -y docker-ce docker-ce-cli containerd.io
        ;;
    *)
        echo "Unsupported OS: $DISTRO" > /home/ec2-user/docker_install_error.txt
        exit 1
        ;;
esac

# Start Docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user || usermod -aG docker ubuntu || true

echo "Docker installed successfully on $DISTRO" > /home/ec2-user/docker_success.txt
