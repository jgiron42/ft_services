#!/bin/sh
/etc/init.d/vsftpd setup
/usr/bin/telegraf &
service vsftpd start
sleep infinity
