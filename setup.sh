#!/usr/bin/env bash

source ./Core/bootstrap.sh

# Services
./Services/system_setup.sh

./Services/nvm.sh

bash ./Services/php.sh
