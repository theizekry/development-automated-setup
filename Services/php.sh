# Associative array of available PHP versions and their corresponding extensions
declare -A php_extensions=(
    ["php7.4"]="php7.4-cli php7.4-common php7.4-curl php7.4-mbstring php7.4-opcache php7.4-readline php7.4-xml php7.4-json php7.4-gd php7.4-mysql php7.4-pgsql php7.4-zip php7.4-intl php7.4-ldap php7.4-imagick php7.4-gmp"
    ["php8.0"]="php8.0-cli php8.0-common php8.0-curl php8.0-mbstring php8.0-opcache php8.0-readline php8.0-xml php8.0-json php8.0-gd php8.0-mysql php8.0-pgsql php8.0-zip php8.0-intl php8.0-ldap php8.0-imagick php8.0-gmp"
    ["php8.1"]="php8.1-cli php8.1-common php8.1-curl php8.1-mbstring php8.1-opcache php8.1-readline php8.1-xml php8.1-json php8.1-gd php8.1-mysql php8.1-pgsql php8.1-zip php8.1-intl php8.1-ldap php8.1-imagick php8.1-gmp"
    ["php8.2"]="php8.2-cli php8.2-common php8.2-curl php8.2-mbstring php8.2-opcache php8.2-readline php8.2-xml php8.2-json php8.2-gd php8.2-mysql php8.2-pgsql php8.2-zip php8.2-intl php8.2-ldap php8.2-imagick php8.2-gmp"
    ["php8.3"]="php8.3-cli php8.3-common php8.3-curl php8.3-mbstring php8.3-opcache php8.3-readline php8.3-xml php8.3-json php8.3-gd php8.3-mysql php8.3-pgsql php8.3-zip php8.3-intl php8.3-ldap php8.3-imagick php8.3-gmp"
)

# Array of available PHP versions
php_versions=("php7.4" "php8.0" "php8.1" "php8.2" "php8.3")

# Function to prompt the user to select a PHP version
select_php_version() {
    echo "Available PHP versions:"
    for ((i=0; i<${#php_versions[@]}; i++)); do
        echo "$(("$i"+1)). ${php_versions[$i]}"
    done
    echo "0. Cancel"

    read -r -p "Enter the number corresponding to the PHP version you want to use: " choice

    if [[ $choice -eq 0 ]]; then
        echo "Operation cancelled."
        exit 0
    fi

    if [[ $choice -gt 0 && $choice -le ${#php_versions[@]} ]]; then
        selected_php_version="${php_versions[$(("$choice"-1))]}"
        echo "Selected PHP version: $selected_php_version"
        # Install PHP extensions for the selected PHP version
        install_php_extensions "$selected_php_version"
    else
        echo "Invalid selection. Please enter a number between 0 and ${#php_versions[@]}."
        select_php_version
    fi
}

# Function to install PHP extensions for a specific PHP version
install_php_extensions() {
    local php_version="$1"
    local extensions="${php_extensions[$php_version]}"

    # Install required packages
    # Add PHP repository and update package lists
    sudo apt install -y software-properties-common
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update

    echo "Installing PHP extensions for $php_version..."
    sudo apt install -y "$php_version-fpm $extensions"

    if command -v "$php_version" &> /dev/null; then
        sudo update-alternatives --set php "/usr/bin/$php_version"
        echo "PHP $php_version has been set as the default version."
    else
       echo "Cannot install $php_version; Skipping installation."
       exit 0
    fi
}

# Prompt the user to select a PHP version
select_php_version
