FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server mariadb-client
RUN service mysql start


CMD ["tail", "-f", "/dev/null"]

