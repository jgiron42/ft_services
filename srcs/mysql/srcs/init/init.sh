#!/bin/ash
/etc/init.d/mariadb setup
/usr/bin/mysql_install_db --datadir="/var/lib/mysql";
service mariadb start
FLAG="$(echo 'SHOW DATABASES;' | mysql | grep wordpress)"
if [ -z "$FLAG" ] ; then
	cat  /tmp/mysql.conf | mysql -u root 
	mysql wordpress -u root < /tmp/wordpress_dump.sql
fi
sleep infinity
