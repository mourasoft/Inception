#!/bin/bash
if [ -d "/var/www/html/wordpress" ] 
then
    echo "wordpress exists"
else
    echo "wordpress does not exist"
    cp -r /tmp/wordpress /var/www/html/
    cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
    sed -i 's/database_name_here/inception/g' /var/www/html/wordpress/wp-config.php
    sed -i 's/username_here/mouras/g' /var/www/html/wordpress/wp-config.php
    sed -i 's/password_here/mouras/g' /var/www/html/wordpress/wp-config.php
    sed -i 's/localhost/mariadb/g' /var/www/html/wordpress/wp-config.php

    chown -R www-data:www-data /var/www/html/wordpress
    # wp config create --dbname=inception --dbuser=mouras --dbpass=mouras --dbhost=mariadb --allow-root --path=/var/www/html/wordpress
    # wp  core config --dbname=inception --dbuser=mouras --dbpass=mouras --path=/var/www/html/wordpress --allow-root 
    sleep 5
    wp core install --url=https://localhost --title='inception' --admin_user=ashley --admin_email=hello@ashleyrich.com --admin_password=password --path=/var/www/html/wordpress --allow-root 


fi

exec "$@"
