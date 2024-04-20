#!/usr/bin/env bash

# Array of available PHP versions
php_versions=("php7.4" "php8.0" "php8.1")

# Function to prompt the user to select a PHP version
select_php_version() {
    echo "Available PHP versions:"
    for ((i=0; i<${#php_versions[@]}; i++)); do
        echo "$(($i+1)). ${php_versions[$i]}"
    done
    echo "0. Cancel"

    read -r -p "Enter the number corresponding to the PHP version you want to use: " choice

    if [[ $choice -eq 0 ]]; then
        echo "Operation cancelled."
        exit 0
    fi

    if [[ $choice -gt 0 && $choice -le ${#php_versions[@]} ]]; then
        selected_php_version="${php_versions[$(($choice-1))]}"
        echo "Selected PHP version: $selected_php_version"
        sudo update-alternatives --set php "/usr/bin/$selected_php_version"
        echo "PHP $selected_php_version has been set as the default version."
    else
        echo "Invalid selection. Please enter a number between 0 and ${#php_versions[@]}."
        select_php_version
    fi
}

# Install PHP versions if not already installed
for php_version in "${php_versions[@]}"; do
    if ! command -v "$php_version" &> /dev/null; then
        echo "Installing $php_version..."
        sudo apt install -y "$php_version"
    fi
done

# Prompt the user to select a PHP version
select_php_version