echo "Installing Node Package Manager ( NVM ) with use Latest node version ..."

# Check if NVM is already installed
if command -v nvm &> /dev/null; then
    echo "NVM is already installed. Skipping installation."
    exit 0
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# shellcheck source=/path/to/.bashrc
source ~/.bashrc

nvm install --lts

node --version
npm --version
