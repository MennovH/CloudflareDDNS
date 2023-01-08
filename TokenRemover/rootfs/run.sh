#!/usr/bin/env bashio

declare HOUR
declare QUARTER
declare DAY

HOUR=$(bashio::config 'hour' | xargs echo -n)
QUARTER=$(bashio::config 'quarter' | xargs echo -n)
DAY=$(bashio::config 'day' | xargs echo -n)

while :
do
	at ${HOUR}:${QUARTER} -f /run.py ${DAY}
	NEXT=$(echo | busybox date -d@"$(( `busybox date +%s`+24*3600 ))" "+%Y-%m-%d %H:%M:%S")
    	echo -e " \nNext check is at ${NEXT}\n "
    	sleep ${INTERVAL}m
done
