#!/usr/bin/env bash
#nmcli con show main


enable(){
	echo "setting dns to 10.0.0.60"
	nmcli con mod main ipv4.dns "10.0.0.60"
	echo "done"
	#nmcli connection reload
	#systemctl restart NetworkManager.service
	echo "bringing connection down"
	nmcli con down main
	echo "done"

	echo "bringing connection up"
	nmcli con up main
	echo "done"

	echo "changing resolv.conf"
	#echo "nameserver 10.0.0.60" > /etc/resolv.conf
	systemctl restart NetworkManager.service
	echo "done"

	# echo "restarting vpn"
	# echo 0 > /tmp/vpn_change.vpnsh
	# echo "done"
}

disable(){
	echo "setting dns to 1.1.1.1"
	nmcli con mod main ipv4.dns "1.1.1.1"
	echo "done"
	#nmcli connection reload
	#systemctl restart NetworkManager.service
	echo "bringing connection down"
	nmcli con down main
	echo "done"

	echo "bringing connection up"
	nmcli con up main
	echo "done"

	echo "changing resolv.conf"
	#echo "nameserver 1.1.1.1" > /etc/resolv.conf
	systemctl restart NetworkManager.service
	echo "done"

	# echo "restarting vpn"
	# echo 0 > /tmp/vpn_change.vpnsh
	# echo "done"
}

wait_for_vpn(){
	ready=$(cat /tmp/vpn_ready.vpnsh)
	while [[ "$ready" -ne "0" ]]; do
		sleep 1
		ready=$(cat /tmp/vpn_ready.vpnsh)
		echo "waiting for vpn"
	done
}

if [ "$EUID" -ne "0" ];then 
	echo "Run as root"
  	exit
fi


address=$(nslookup steam.cache.lancache.net | tail -n2)
if [ "$address" == "Address: 10.0.0.60" ];then
	echo "switching off lancache"
	disable
else
	echo "switching on lancache"
	enable
fi


wait_for_vpn
systemctl restart NetworkManager.service
sleep 4
wait_for_vpn

nslookup steam.cache.lancache.net