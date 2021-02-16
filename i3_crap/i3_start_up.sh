#!/usr/bin/env bash

basic_func(){
	~/scrips/cpu-fast.sh
	sleep 3
	toilet -f big -t " running xrandr fix "
	~/scrips/i3_crap/fixxorg.sh
	sleep 2
	toilet -f big -t " restarting i3 "
	i3-msg restart
	sleep 1
}

mount_all_disks(){
	toilet -f big -t " mounting luks "
	if ! mount | grep /temp > /dev/null; then
		sudo cryptsetup luksOpen /dev/nvme0n1p3 temp
		sudo mount /dev/mapper/temp /temp
	else
		toilet -f big -t " luks already mounted "
	fi

	toilet -f big -t "mounting 2tb hdd"
	if ! mount | grep /media/veracrypt1 > /dev/null; then
		twotbbhdd=$(hwinfo --disk | grep "/dev/sd.*ST2000LX001-1RG1" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
		#twotbbhdd=$(hwinfo --disk | grep "/dev/sd.*ST5000LM000-2AN170_WCJ2HMKF" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
		stty -echo
		printf "Password: "
		sudo veracrypt -t $twotbbhdd /media/veracrypt1 --non-interactive --stdin > /dev/null 2>&1
		stty echo
		printf "\r\033[K"
	else
		toilet -f big -t " 2tb hdd already mounted "
	fi

	# toilet -f big -t "mounting 2tb ssd"
	# crutial=$(hwinfo --disk | grep "/dev/sd.*CT2000MX500SSD1" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
	# stty -echo
	# printf "Password: "
	# sudo veracrypt -t $crutial /media/2tbssd --non-interactive --stdin > /dev/null 2>&1
	# stty echo
	# printf "\r\033[K"

	toilet -f big -t "mounting 2tb ssd"
	if ! mount | grep /media/2tbssd > /dev/null; then
		crutial=$(hwinfo --disk | grep "/dev/sd.*CT2000MX500SSD1" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
		sudo mount ${crutial}1 /media/2tbssd
	else
		toilet -f big -t " 2tb sdd already mounted "
	fi

	toilet -f big -t "mounting 1tb ssd"
	if ! mount | grep /media/1tbssd > /dev/null; then
		wdonetbssd=$(hwinfo --disk | grep "/dev/sd.*WDS100T2B0B-" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
		sudo mount ${wdonetbssd}2 /media/1tbssd
	else
		toilet -f big -t " 1tb sdd already mounted "
	fi

	toilet -f big -t " Mounting 5tb hddd"
	if ! mount | grep /media/5tbhdd > /dev/null; then
		wdonetbssd=$(hwinfo --disk | grep "/dev/sd.*2AN170_WCJ2HMKF" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
		if [[ -z $wdonetbssd ]]; then
			toilet -f big -t " 5tb hdd is not connected"
		else	
			sudo mount ${wdonetbssd}2 /media/5tbhdd
		fi
	else
		toilet -f big -t " 5tb hdd already mounted "
	fi

	# echo "Music HDD"
	# musichdd=$(hwinfo --disk | grep "/dev/sd.*WDC_WD10EZEX-00WN4A0_WD-WCC6Y3KF8JAH" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
	# stty -echo
	# printf "Password: "
	# sudo veracrypt -t $musichdd /nfs/music --non-interactive --stdin > /dev/null 2>&1
	# if [[ $? -ne 0 ]]; then
	# 	stty echo
	# 	echo -e "\ncannot mount music"
	# 	exit 1
	# fi	
	# stty echo
	# printf "\r\033[K"

	# echo "Movies HDD"
	# movieshdd=$(hwinfo --disk | grep "/dev/sd.*ST4000LM024-2AN17V_WCK2YNWM" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
	# stty -echo
	# printf "Password: "
	# sudo veracrypt -t $movieshdd /nfs/movies --non-interactive --stdin > /dev/null 2>&1
	# if [[ $? -ne 0 ]]; then
	# 	stty echo
	# 	echo -e "\ncannot mount movies"
	# 	exit 2
	# fi
	# stty echo
	# printf "\r\033[K"

	# echo "Games HDD"
	# gameshdd=$(hwinfo --disk | grep "/dev/sd.*TOSHIBA_HDWD120_86E4E91AS" | cut -d ":" -f2 | cut -d " " -f 2 | sed 's/.$//')
	# sudo mount ${gameshdd}1 /nfs/games
	# if [[ $? -ne 0 ]]; then
	# 	stty echo
	# 	echo -e "\ncannot mount games"
	# 	exit 3
	# fi	

	#try mount nas
	echo "attempting to mount nas drives"
	if sudo ~/scrips/mount_nfs.sh; then
		echo "nas drives mounted successfully"
	else
		echo "Failed to mount nas drives try running ~/scrips/mount_nfs.sh manually or server can be down? let me check"
		if ping 10.0.0.69 -c 1 -W 0.3 > /dev/null; then
			echo "ok server is online try restarting systemctl restart nfs.server on nas"
		else
			echo "server is down there is your problem"
		fi		
	fi	
}

launch_apps_left_monitor(){
	i3-msg "move container to workspace 8" > /dev/null # move terminal to 8
	i3-msg "workspace 6" > /dev/null
	echo "starting jack"
	i3-msg "exec qjackctl" > /dev/null
	sleep 5 # needed for jack to start up properly
	echo "starting non-mixer"
	i3-msg "exec non-mixer /temp/mixer" > /dev/null
	#echo "starting bettergram"
	echo "starting telegram"
	#i3-msg "exec bettergram" > /dev/null
	i3-msg "exec /temp/Telegram/Telegram" > /dev/null
	sleep 3 # it needs a few minutes to start up
	#now we need to launch the jack pulse jack yoke
	# then we need to open up the mplayer fix
	i3-msg -t get_tree | jq "recurse(.nodes[]) | .window_properties | objects | .title " | grep "Messages / Status — QjackCtl" && echo "removing messages" && i3-msg "[title=\"Messages / Status\"] focus; kill" > /dev/null
	i3-msg -t get_tree | jq "recurse(.nodes[]) | .window_properties | objects | .title " | grep "Patchbay — QjackCtl" && echo "removing patchbay" && i3-msg "[title=\"Patchbay\"] focus; kill" > /dev/null
	#echo "getting qjackctl"
	i3-msg "[title=\"JACK Audio Connection Kit [(default)]*\"] focus" > /dev/null
	i3-msg "split h" > /dev/null
	i3-msg "exec xfce4-terminal -T mplayer_fix -x ~/scrips/jack/mplayer_remove.sh" > /dev/null
	#y3-msg -t get_tree | jq "recurse(.nodes[]) | .window_properties | objects | .title " | grep "Bettergram" && echo "moving bettergram" && i3-msg "[class=\"Bettergram\"] focus; move down; move down; move down" > /dev/null
	i3-msg -t get_tree | jq "recurse(.nodes[]) | .window_properties | objects | .title " | grep "Telegram" && echo "moving telegram" && i3-msg "[class=\"Telegram\"] focus; move down; move down; move down" > /dev/null
	~/scrips/jack/jack-post-start.sh
	~/scrips/jack/jack-post-start.sh
}

launch_apps_right_monitor(){
	i3-msg "workspace 8" > /dev/null
	i3-msg "split h" > /dev/null
	i3-msg "exec xfce4-terminal -T htop -x htop" > /dev/null
	ping 10.0.0.69 -c 1 -W 0.3 > /dev/null && i3-msg "exec xfce4-terminal -T mynas -x ssh nas@10.0.0.69" > /dev/null && sleep 1 && i3-msg "move down"  > /dev/null
}

launch_apps(){
	launch_apps_left_monitor
	launch_apps_right_monitor
	i3-msg "exec xfce4-terminal -T htop -x ~/scrips/vpn/s/Openvpn-connector-script-server/set_default_config.sh" > /dev/null
}

main_loop(){
	while true; do
		./scrips/vpn/vpn
	done	
}



#toilet -f big -t " launching layouts "
#i3-msg "workspace 4:Monitoring; append_layout ~/.layouts/worspace4_2.json"
#sleep 2

#toilet -f big -t " launching programs "
#i3-msg "workspace 4:Monitoring; exec xfce4-terminal -T htop -x htop; exec xfce4-terminal -T vpn -x ~/scrips/vpn.sh; exec xfce4-terminal -T network_test -x ~/scrips/network_test.sh;"

#i3-msg "workspace 4:Monitoring; exec pulseeffects; exec xfce4-terminal -T monitor -x ~/scrips/monitor_temp.sh; exec xfce4-terminal -T nethogs -x ~/scrips/nethogs_looper.sh; exec telegram-desktop"


#nohup xfce4-terminal -T htop -x htop & 
#nohup xfce4-terminal -T vpn -x /home/human/scrips/vpn.sh &
#telegram-desktop &

#sleep 1
#send problamatic fuckers

#toilet -f big -t " launching troublesome programs "
#i3-msg "exec veracrypt; exec com.github.lainsce.notejot"

#toilet -f big -t " starting gufw "
#sudo nohup gufw &

catch_exit(){
	main_loop
}
trap "catch_exit" 2

basic_func
mount_all_disks


#launch i3 apps
launch_apps

main_loop






