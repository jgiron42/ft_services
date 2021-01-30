#!/bin/sh
influxd & influx < /tmp/db.conf
sleep infinity
