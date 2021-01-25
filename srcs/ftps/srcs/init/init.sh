#!/bin/sh
/usr/bin/telegraf &
vsftpd /etc/vsftpd/vsftpd.conf
sleep infinity
