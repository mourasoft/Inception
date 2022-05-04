#!/bin/bash
if [ -d "/var/www/html/wordpress/adminer" ]
then
    echo "adminer already installed"
else
    echo "installing adminer"
    mkdir -p /var/www/html/wordpress/adminer/
    cp -r /tmp/index.php /var/www/html/wordpress/adminer/
fi  

exec "$@"