#!/bin/bash
if [ -d "/var/www/html/wordpress/wp-admin" ] 
then
    echo "wordpress exists"
else
    echo "wordpress does not exist"
    cp -r /tmp/wordpress /var/www/html/
    cp /wp-config.php /var/www/html/wordpress/
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wordpress/wp-config.php
    sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wordpress/wp-config.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wordpress/wp-config.php
    chown -R www-data:www-data /var/www/html/wordpress
    sleep 5
    wp core install --url=https://localhost --title='inception' --admin_user=$WP_ADMIN_USER --admin_email=hello@ashleyrich.com --admin_password=$WP_ADMIN_USER_PASSWORD --path=/var/www/html/wordpress --allow-root 
    wp user create $WP_USER mouras@gmail.com --role=subscriber  --user_pass=$WP_USER_PASSWORD  --path=/var/www/html/wordpress  --allow-root 
    wp theme install galaxis --activate --path=/var/www/html/wordpress --allow-root
    wp plugin install  redis-cache --activate --path=/var/www/html/wordpress/ --allow-root
    wp redis enable --path=/var/www/html/wordpress/ --allow-root 

fi

exec "$@"
