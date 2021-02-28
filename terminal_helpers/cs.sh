#!/usr/bin/env bash

help(){
	Cyan='\033[0;32m'
	LightPurple='\033[1;35m'
	NC='\033[0m'
	change_to_dir=$(echo $change_to_dirfile || none)

	echo -e "			$LightPurple  v: ${Cyan}/media/veracrypt1 \n\
			$LightPurple  d: ${Cyan}~/Downloads \n\
			$LightPurple  t: ${Cyan}/tmp \n\
			$LightPurple tt: ${Cyan}/temp \n\
			$LightPurple  s: ${Cyan}~/scrips \n\
			$LightPurple  v: ${Cyan}/media/veracrypt1 \n\
			$LightPurple  g: ${Cyan}/media/veracrypt1/GIT \n\
			$LightPurple  k: ${Cyan}/media/veracrypt1/Klusters \n\
			$LightPurple  1: ${Cyan}/media/1tbssd \n\
			$LightPurple  2: ${Cyan}/media/2tbssd \n\
			$LightPurple  m: ${Cyan}/nas/nfs-movies \n\
			$LightPurple ms: ${Cyan}/nas/nfs-movies/new_series \n\
			$LightPurple mu: ${Cyan}/nas/nfs-music/Music \n\
			$LightPurple  a: ${Cyan}/nas/nfs-android \n\
			$LightPurple dd: ${Cyan}/nas/nfs-dump \n\
			$LightPurple pp: ${Cyan}save current path \n\
			$LightPurple  p: ${Cyan}saved path: $(cat $change_to_dirfile_cs_sh 2>/dev/null || echo None saved) \n\
			$NC"
}

change_to_dirfile_cs_sh=/tmp/cs.sh.change_to_dir

save_change_to_dir(){
	pwd > $change_to_dirfile_cs_sh
}

load_change_to_dir(){
	change_to_dir=$(cat $change_to_dirfile_cs_sh)
	if [ -d $change_to_dir ]; then
		cd $change_to_dir
	else
		echo Cannot cd into $change_to_dir
	fi
}

case $1 in
	"v")
		cd /media/veracrypt1
		;;
	"d")
		cd ~/Downloads
		;;
	"dd")
		cd /nas/nfs-dump
		;;
	"m")
		cd /nas/nfs-movies
		;;
	"ms")
		cd /nas/nfs-movies/new_series
		;;
	"mu")
		cd /nas/nfs-music/Music
		;;
	"t")
		cd /tmp
		;;
	"tt")		
		cd /temp
		;;
	"s")		
		cd ~/scrips
		;;	
	"g")		
		cd /media/veracrypt1/GIT
		;;	
	"k")		
		cd /media/veracrypt1/Klusters
		;;		
	"1")		
		cd /media/1tbssd
		;;	
	"2")		
		cd /media/2tbssd
		;;	
	"a")		
		cd /nas/nfs-android 
		;;	
	"p")		
		load_change_to_dir
		;;	
	"pp")		
		save_change_to_dir
		;;	
	"h" | "-h")		
		help
		;;	
	*)
		cd $1
		;;
esac			
