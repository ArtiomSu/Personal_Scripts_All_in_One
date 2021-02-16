#!/usr/bin/env bash

mount_disks_bg(){
	#music
	if ! mount | grep /nas/nfs-music > /dev/null; then
		musicok=$(showmount -e mynas | grep music)
		if [[ -z $musicok ]]; then
			echo "music not found"
		else
			sudo mount -t nfs -o vers=4 mynas:/nfs/music /nas/nfs-music
		fi	
	else
		echo "music already mounted"
	fi	

	#games
	if ! mount | grep /nas/nfs-games > /dev/null; then
		gamesok=$(showmount -e mynas | grep games)
		if [[ -z $gamesok ]]; then
			echo "games not found"
		else
			sudo mount -t nfs -o vers=4 mynas:/nfs/games /nas/nfs-games
		fi	
	else
		echo "games already mounted"
	fi	

	#movies
	if ! mount | grep /nas/nfs-movies > /dev/null; then
		moviesok=$(showmount -e mynas | grep movies)
		if [[ -z $moviesok ]]; then
			echo "movies not found"
		else
			sudo mount -t nfs -o vers=4 mynas:/nfs/movies /nas/nfs-movies
		fi	
	else
		echo "movies already mounted"
	fi

	#dump
	if ! mount | grep /nas/nfs-dump > /dev/null; then
		dumpok=$(showmount -e mynas | grep dump)
		if [[ -z $dumpok ]]; then
			echo "dump not found"
		else
			sudo mount -t nfs -o vers=4 mynas:/media/shitfedora1tb/dump /nas/nfs-dump
		fi	
	else
		echo "dump already mounted"
	fi

	#android
	if ! mount | grep /nas/nfs-android > /dev/null; then
		androidok=$(showmount -e mynas | grep android_shit)
		if [[ -z $androidok ]]; then
			echo "android_shit not found"
		else
			sudo mount -t nfs -o vers=4 mynas:/media/shitfedora1tb/android_shit /nas/nfs-android
		fi	
	else
		echo "android_shit already mounted"
	fi

	#8tbhdd
	if ! mount | grep /nas/nfs-8tbhdd > /dev/null; then
		eighttb=$(showmount -e mynas | grep 8tbhdd)
		if [[ -z $eighttb ]]; then
			echo "8tbhdd not found"
		else
			sudo mount -t nfs -o vers=4 mynas:/nfs/8tbhdd /nas/nfs-8tbhdd
		fi	
	else
		echo "8tbhdd already mounted"
	fi	
}


if [[ "$1" == "-u" ]]; then
	sudo umount -f /nas/nfs-music
	sudo umount -f /nas/nfs-games
	sudo umount -f /nas/nfs-movies
	sudo umount -f /nas/nfs-dump
	sudo umount -f /nas/nfs-android
	sudo umount -f /nas/nfs-8tbhdd
	exit 0
else
	mount_disks_bg &
	sleep 5	# give it 5 seconds to mount it should be plenty of time
	if [ ! -z "$(df -h | grep nas | head -n1)" ]; then
		df -h | grep Filesystem && df -h | grep nas
		exit 0
	else
		exit 1
	fi	
fi



