#!/bin/sh
export DB_PORT=$MY_SQL_PORT
php-fpm7
chmod 777 /run/php7-fpm/php7-fpm.sock
nginx
sleep infinity
