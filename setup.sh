#!/bin/bash

source ./Core/bootstrap.sh

# check command is run as sudo

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Services
./Services/system_setup.sh

./Services/nvm.sh

bash ./Services/php.sh
