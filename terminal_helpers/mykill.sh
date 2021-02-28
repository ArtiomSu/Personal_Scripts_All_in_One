#!/usr/bin/env bash

while [[ $(ps -A | grep $1)  ]]; do
	echo -ne "$1 is still alive at $(date)\r"
	killall -9 $1 > /dev/null 2>&1
	sleep 0.5
done
echo $1 should be dead

