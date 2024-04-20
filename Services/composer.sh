php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
echo ">>> Verfiying Composer setup data integrity "
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer Verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"


echo ">>> Installing Composer${NC}"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php