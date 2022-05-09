#!/bin/bash
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ] 
then
    echo "the database $MYSQL_DATABASE exists"
else
    service mysql start > /dev/null 2>&1
    echo "$MYSQL_DATABASE database does not exist"
    mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;";
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" ;
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES;" ;
    mysql -u root -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" ;
    kill `cat /var/run/mysqld/mysqld.pid`
  
fi

exec "$@"