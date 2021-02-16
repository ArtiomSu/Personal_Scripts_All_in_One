#!/bin/env bash


run (){
	Connection="$(nmcli -t -f NAME c show --active)"
	dnsBefore="$(nmcli dev show | grep DNS | awk '{ print $2; }')"
	echo "dns before hand $dnsBefore"
	echo "changing connection ${Connection}"
	qouates="\""
	Con=$qouates$Connection$qouates
	
	nmcli connection modify "$Connection" ipv4.ignore-auto-dns yes

	nmcli connection modify "$Connection" ipv4.dns 8.8.8.8
	echo "connection modified"
	nmcli connection down "$Connection"
	echo "connection down"
	sleep 1
	nmcli connection up "$Connection"
	sleep 1
	echo "connection up"
	dnsAfter="$(nmcli dev show | grep DNS | awk '{ print $2; }')"
	echo "dns Now $dnsAfter"
	if [[ "$dnsAfter" != "8.8.8.8"  ]]; then
		echo "dns feked running again"
		run
	fi
}

run