#!/bin/bash

if command -v kubectl &> /dev/null
then
    echo "kubectl is already installed."
    exit 0
fi

# Determine the operating system
latest=$(uname -Ubuntu 22.04 | tr '[:upper:]' '[:lower:]')

# Download the latest version of kubectl
echo "Downloading kubectl..."
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/$OS/amd64/kubectl"
pwd
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
pwd
chmod +x kubectl


# Check if kubectl is executable
if [ ! -x kubectl ]; then
    echo "Failed to make kubectl executable."
    exit 1
fi

# Move kubectl to a directory in the PATH
sudo mv kubectl /home/runner/work/.github/workflows

# Check if kubectl installation was successful
if command -v kubectl &> /dev/null
then
    echo "kubectl has been installed successfully."
else
    echo "Failed to install kubectl."
    exit 1
fi

# Make kubectl executable
chmod +x kubectl

# Move kubectl to a directory in the PATH
sudo mv kubectl /home/runner/work/

# Check if kubectl installation was successful
if command -v kubectl &> /dev/null
then
    echo "kubectl has been installed successfully."
else
    echo "Failed to install kubectl."
    exit 1
fi
