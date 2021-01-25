#!/bin/sh
/usr/bin/telegraf &
/grafana/bin/grafana-server -homepath /grafana/
sleep infinity
