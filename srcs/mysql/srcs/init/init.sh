#!/bin/ash
FLAG="$(echo 'SHOW DATABASES;' | mysql | grep wordpress)"
if [ -z "$FLAG" ] ; then
	/usr/bin/mysql_install_db --datadir="/var/lib/mysql";
	service mariadb start
	cat  /tmp/mysql.conf | mysql -u root 
	mysql wordpress -u root < /tmp/wordpress_dump.sql
	/etc/init.d/mariadb setup
fi
service mariadb start
sleep infinity
