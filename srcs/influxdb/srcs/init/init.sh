#!/bin/sh
/usr/bin/telegraf &
influxd & influx < /tmp/db.conf
sleep infinity
