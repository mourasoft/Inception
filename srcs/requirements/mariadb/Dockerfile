FROM debian:buster
RUN apt-get update && apt-get install mariadb-server mariadb-client -y
COPY . /tmp
RUN chmod -R 777 /tmp/
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT [ "/tmp/tools/script.sh" ]
CMD [ "mysqld_safe" ]




