FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget git

RUN mkdir /run/php/
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz > /dev/null 2>&1 
RUN tar -xzf /tmp/wordpress.tar.gz -C /tmp/ && rm /tmp/wordpress.tar.gz
# RUN cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
# RUN sed -i 's/database_name_here/inception/g' /var/www/html/wordpress/wp-config.php
# RUN sed -i 's/username_here/mouras/g' /var/www/html/wordpress/wp-config.php
# RUN sed -i 's/password_here/mouras/g' /var/www/html/wordpress/wp-config.php
# RUN sed -i 's/localhost/mariadb/g' /var/www/html/wordpress/wp-config.php
# RUN chown -R www-data:www-data /var/www/html/wordpress
CMD [ "php-fpm7.3", "--nodaemonize" ]
# apt-get install nginx mariadb-server mariadb-client 