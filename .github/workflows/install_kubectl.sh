#!/bin/bash

# Check if kubectl is already installed
if command -v kubectl &> /dev/null
then
    echo "kubectl is already installed."
    exit 0
fi

# Download the latest version of kubectl
echo "Downloading kubectl..."
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# Make kubectl executable
chmod +x kubectl

# Move kubectl to a directory in the PATH
sudo mv kubectl /usr/local/bin/

# Check if kubectl installation was successful
if command -v kubectl &> /dev/null
then
    echo "kubectl has been installed successfully."
else
    echo "Failed to install kubectl."
    exit 1
fi
