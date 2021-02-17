#!/usr/bin/env bash

num_connections=10

user_agents=(
		"Mozilla/5.0 CK={} (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko"
		"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36"
		"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393"
		"Mozilla/5.0 (compatible, MSIE 11, Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko"
		"Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0; MDDCJS)"
	)

if [[ "$1" == "-h" ]]; then
	echo "This script uses axel to download files"
	echo "This script also chooses a random user agent as some websites might block unknown"
	echo ""
	echo "Usage:"
	echo "$0 https://your_url_to_file.com optional_num_connections"
	echo "This example will download a file with 20 connections"
	echo "$0 http://speedtest.ftp.otenet.gr/files/test100Mb.db 20"
	echo ""
	echo "Use a lower number of connections for faster websites ( 10 is the default if you dont specify anything ). And for slow ass websites I find that 30 works well"
	exit 0
fi

user_agent=${user_agents[$RANDOM % ${#user_agents[@]} ]}

if [ -z $1 ]; then
	echo "need a url see -h for help"
	exit 0
fi

if [ ! -z $2 ]; then
	num_connections=$2		
fi

echo "downloading $1 with $num_connections connections "
axel -n "$num_connections" -U "$user_agent" -vvv "$1"

