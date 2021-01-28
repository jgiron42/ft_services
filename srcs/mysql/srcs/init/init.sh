#!/bin/ash
FLAG="$(echo 'SHOW DATABASES;exit;' | mysql | grep anclarma)"

if [ -z "$FLAG" ] ; then
	/usr/bin/mysql_install_db --datadir="/var/lib/mysql";
	/etc/init.d/mariadb setup
	cat  /tmp/mysql.conf | mysql -u root 
	mysql wordpress -u root < /tmp/wordpress_dump.sql > /tmp/mysqlog
	/usr/bin/telegraf &
	#/usr/bin/mysqld --user=root & sleep 3
fi
service mariadb start;
sleep infinity
