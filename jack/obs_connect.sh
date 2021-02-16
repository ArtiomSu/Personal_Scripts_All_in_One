#!/usr/bin/env bash

check(){
	out="$(jack_lsp -c | grep "Obs jack input")"
	if [[ -z $out ]]; then
		echo "Obs jack input not found"
		return 1
	fi
	
	out="$(jack_lsp -c | grep "Obs jack mic")"
	if [[ -z $out ]]; then
		echo "Obs jack mic not found"
		return 2
	fi

	return 0
}

check_out(){
	out="$(jack_lsp -c | grep "Non-Mixer (default):mic/out-1" | head -n 1)"
	if [[ -z $out ]]; then
		echo "Non-Mixer (default):mic/out-1 not found"
		return 1
	fi
	
	out="$(jack_lsp -c | grep "Non-Mixer (master):master/out-1" | head -n 1)"
	if [[ -z $out ]]; then
		echo "Non-Mixer (master):master/out-1 not found"
		return 2
	fi

	out="$(jack_lsp -c | grep "Non-Mixer (master):master/out-2" | head -n 1)"
	if [[ -z $out ]]; then
		echo "Non-Mixer (master):master/out-2 not found"
		return 3
	fi

	return 0
}

connect(){
	jack_connect "Obs jack mic:in_1" "Non-Mixer (default):mic/out-1"
	jack_connect "Obs jack mic:in_2" "Non-Mixer (default):mic/out-1"
	jack_connect "Obs jack input:in_1" "Non-Mixer (master):master/out-1"
	jack_connect "Obs jack input:in_2" "Non-Mixer (master):master/out-2"
}

disconnect(){
	jack_disconnect "Obs jack mic:in_1" "Non-Mixer (default):mic/out-1"
	jack_disconnect "Obs jack mic:in_2" "Non-Mixer (default):mic/out-1"
	jack_disconnect "Obs jack input:in_1" "Non-Mixer (master):master/out-1"
	jack_disconnect "Obs jack input:in_2" "Non-Mixer (master):master/out-2"
}

if [ "$1" == "-d" ]; then
	check && check_out && disconnect
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo -e "USAGE\nConnect obs ports:\n\t$0\nDisconnect obs ports:\n\t$0 -d"
else
	check && check_out && connect
fi
