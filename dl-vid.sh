#!/usr/bin/env bash
channel=""
dpath="$HOME/Downloads/youtube_vids/"
get_channel(){
	name="$(curl -s $1 | grep -m 1 'Unsubscribe from' | sed 's/Unsubscribe from //g' | sed 's/.\{1\}$//' | sed 's/ //g' )"
 	if [ ! -f $name ]; then
 		channel="$name"
 	fi	
}

get_best_quality(){
	if [ "$2" == "m" ]; then
		return 1
	elif [ "$2" == "w" ]; then
		return 0
	else
		echo " choose whether to use mp4 or webm "	
		output="$(youtube-dl -F $1)"
		toilet -f big -t "   mp4"
		echo "$output" | grep "video only" | grep "mp4"
		toilet -f big -t "   webm"
		echo "$output" | grep "video only" | grep "webm"
		read -n1 -p "Type 'm' for mp4, 'w' for webm:" input
		if [ "$input" == "m" ]; then
			return 1
		else 
			return 0
		fi		
	fi
}

get_info(){
	get_channel $1
	echo "saving to ${dpath}$channel"
	mkdir -p "${dpath}$channel"
	cd "${dpath}$channel" || cd "${dpath}"
}

download(){
	#get_info $1
	cd "${dpath}"

	# get user to choose wether to use mp4 or webm or just use the second commandline arguement
	get_best_quality $1 $2
	if [ "$?" == "0" ]; then
		youtube-dl -f 'bestvideo[ext=webm]+bestaudio[ext=webm]/bestvideo+bestaudio' --merge-output-format webm $1
	else
		youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 $1
	fi
}

download_playlist(){
	get_info $1
	mkdir -p "playlist_$3"
	cd "playlist_$3"

	youtube-dl -i -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --yes-playlist --merge-output-format mp4 $1


}

if [ "$1" == "-h" ] || [ "$1" == "-help" ] || [ "$2" == "-h" ] || [ "$2" == "-help" ]; then
	echo "Usage: $0 https://www.youtube.com/watch\?v\=AAAAAAAAA"
	echo "you can specify default format to use otherwise it will ask you"
	echo "for mp4 use: $0 https://www.youtube......... m"
	echo "for webm use: $0 https://www.youtube......... w"
	echo ""
	echo "to download whole playlist use $0 https://www.youtube......... p name"
	echo "name is any name you want. this will create a folder called playlist_name"
	exit 0
fi	


if [ ! -z $3 ]; then
	download_playlist $1 $2 $3
else
	download $1 $2
fi	

