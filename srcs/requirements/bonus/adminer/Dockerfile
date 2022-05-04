FROM debian:buster

#install adminer 
RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget 

RUN  wget "http://www.adminer.org/latest.php" -O /tmp/index.php
COPY tools .
RUN chmod -R 777 /script.sh
ENTRYPOINT [ "/script.sh" ]
CMD ["php","-S","0.0.0.0:4000"]