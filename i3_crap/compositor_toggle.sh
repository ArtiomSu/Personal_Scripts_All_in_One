#!/usr/bin/env bash

if [[ -z $(ps -A | grep picom) ]]; then
	picom -b
else
	while [[ $(ps -A | grep picom)  ]]; do
		killall picom > /dev/null 2>&1
		sleep 0.5
	done
fi
