#!/bin/sh
/etc/init.d/influxdb setup
service influxdb start
FLAG="$(echo 'SHOW DATABASES;' | influx | grep grafana)"
if [ -z "$FLAG" ] ; then
	influx < /tmp/db.conf
fi
sleep infinity
