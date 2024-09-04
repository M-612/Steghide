#!/bin/bash

# Define a function to check if Steghide is already installed
check_steghide_installed() {
    if command -v steghide &> /dev/null; then
        echo "Steghide is already installed."
        return 0
    else
        return 1
    fi
}

# Define a function to install Steghide using apt-get
install_steghide() {
    echo "Installing Steghide using apt-get..."
    sudo apt-get update
    sudo apt-get install -y steghide
}

# Define a function to install dependencies from requirements.txt
install_dependencies() {
    if [ -f "requirements.txt" ]; then
        echo "Installing dependencies from requirements.txt..."
        sudo apt-get update
        xargs -a requirements.txt sudo apt-get install -y
    else
        echo "requirements.txt not found. Skipping dependency installation."
    fi
}

# Main script execution
if check_steghide_installed; then
    echo "No Steghide installation needed."
else
    install_steghide
    echo "Steghide installation completed."
fi

# Install dependencies
install_dependencies
