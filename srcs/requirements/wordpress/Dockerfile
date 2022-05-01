FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget curl git vim

RUN mkdir /run/php/
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz > /dev/null 2>&1 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN tar -xzf /tmp/wordpress.tar.gz -C /tmp/ && rm /tmp/wordpress.tar.gz
RUN chmod +x /var/www/html/wp-cli.phar
RUN mv /var/www/html/wp-cli.phar /usr/local/bin/wp 

WORKDIR /
COPY tools .
RUN chmod -R 777 /script.sh
ENTRYPOINT [ "/script.sh" ]

CMD [ "php-fpm7.3", "--nodaemonize" ]
# apt-get install nginx mariadb-server mariadb-client 