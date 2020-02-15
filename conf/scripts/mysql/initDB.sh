#!/usr/bin/env bash

if [ `ls /var/lib/mysql | wc -l` -eq 0 ];
then
    DB_DATA_PATH="/var/lib/mysql"
    DB_ROOT_PASS="mariadb_root_password"
    DB_USER="mariadb_user"
    DB_PASS="mariadb_user_password"
    DB_NAME="dbname"

    #su mysql -c "/usr/sbin/mysqld --initialize-insecure"
    mysqld --user=mysql --datadir=${DB_DATA_PATH} --initialize-insecure
    mysqld --datadir=${DB_DATA_PATH} --user=mysql &
    sleep 5
    mysqladmin -u root password "${DB_ROOT_PASS}"

    echo "GRANT ALL ON *.* TO ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION;" > /tmp/sql
    echo "GRANT ALL ON *.* TO ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION;" >> /tmp/sql
    echo "GRANT ALL ON *.* TO ${DB_USER}@'::1' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION;" >> /tmp/sql
    echo "DELETE FROM mysql.user WHERE User='';" >> /tmp/sql
    #echo "DROP DATABASE test;" >> /tmp/sql
    echo "FLUSH PRIVILEGES;" >> /tmp/sql
    echo "CREATE DATABASE ${DB_NAME};" >> /tmp/sql
    cat /tmp/sql | mysql -u root --password="${DB_ROOT_PASS}"
    rm /tmp/sql

#    mysql -u root --password="${DB_ROOT_PASS}" "${DB_NAME}" < /home/dumps/dump.sql
fi