#!/bin/ash
/usr/bin/mysql_install_db --datadir="/var/lib/mysql";
/usr/bin/telegraf &
/usr/bin/mysqld --user=root --init_file=/tmp/mysql.conf & 
mysql wordpress -u root < /tmp/wordpress_dump.sql
#/usr/bin/mysqld --user=root & sleep 3

sleep infinity
