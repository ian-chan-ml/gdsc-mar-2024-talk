#!/bin/bash

# Update all packages
yum update -y

# Install required packages
yum install -y \
    yum-plugin-config-manager \
    git \
    curl

# Add the Docker repository
yum config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker
yum install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Add the current user to the docker group
# Note: This will take effect at the next login. You might want to log out and log back in or use 'newgrp docker' in the same session.
groupadd docker
usermod -aG docker $USER

newgrp docker

git clone https://github.com/ian-chan-ml/gdsc-mar-2024-talk.git
