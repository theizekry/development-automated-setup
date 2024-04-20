#!/bin/bash

# Perform system updates
perform_system_updates() {
    echo "Updating package lists..."
    sudo apt update -y

    echo "Upgrading installed packages..."
    sudo apt upgrade -y
}

# Install common development dependencies
install_common_dependencies() {
    echo "Installing common development dependencies..."
    sudo apt-get install -y network-manager libnss3-tools jq xsel
}

# Install essential build tools
install_build_tools() {
    echo "Installing essential build tools..."
    sudo apt install -y build-essential
}

# Install version control systems
install_version_control() {
    echo "Installing version control systems..."
    sudo apt install -y git
}

# Install text editors
install_text_editors() {
    echo "Installing text editors..."
    sudo apt install -y vim nano
}

# Install Python development tools
install_python() {
    echo "Installing Python development tools..."
    sudo apt install -y python3 python3-pip
}

# Install database systems
install_databases() {
    echo "Installing database systems..."
    sudo apt install -y mysql-server sqlite3
}

# Install other useful tools
install_other_tools() {
    echo "Installing other useful tools..."
    sudo apt install -y curl wget unzip
}

# Clean up
clean_up() {
    echo "Cleaning up..."
    apt-get clean
    rm -rf /var/lib/apt/lists/*
}

# Main function to orchestrate the setup
main() {
    perform_system_updates
    install_common_dependencies
    install_build_tools
    install_version_control
    install_text_editors
    install_python
    install_databases
    install_other_tools
    clean_up

    echo "System setup complete."
}

# Call the main function
main
