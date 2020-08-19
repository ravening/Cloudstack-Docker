#!/bin/sh

/usr/bin/mysqld_safe &
sleep 10
mysql cloud < /root/cloud.sql
mysql cloud_usage < /root/cloud_usage.sql
mysql simulator < /root/simulator.sql
/usr/bin/supervisord
