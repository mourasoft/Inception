FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server 
COPY . /tmp
RUN chmod -R 777 /tmp/
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN service mysql restart 
# CMD ["mysqld_safe"]
ENTRYPOINT [ "/tmp/tools/script.sh" ]

CMD [ "mysqld_safe" ]




