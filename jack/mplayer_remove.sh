#!/usr/bin/env dash

count=0
display(){
	results="$($HOME/scrips/monitor_temp.sh 2)"
	clear
	echo "${results}\nfound bad mplayer $count times"
}

#check if mplayer has connections
remove(){
	mplayer_out1="$(jack_lsp -c | grep "^MPlayer.*out_0$")"
	mplayer_out2="$(jack_lsp -c | grep "^MPlayer.*out_1$")"
	if [ ! -z "$mplayer_out1" ] 
	then
		#echo "found mplayer outs $mplayer_out1 $mplayer_out2"
		count=$((count = count + 1))
		jack_disconnect "$mplayer_out1" "system:playback_1"
		jack_disconnect system:playback_2 "$mplayer_out2"
	else
		echo "nothing found exiting"
	fi
}

# so here we check if the second part of mplayer has system since it looks like this
#MPlayer [316397]:out_0
#   Non-Mixer (default):smplayer in/in-1
#   system:playback_1
#MPlayer [316397]:out_1
#   Non-Mixer (default):smplayer in/in-2
#   system:playback_2
check(){
	out="$(jack_lsp -c | grep "MPlayer" -A 2 | grep "system:playback")"
	if [ ! -z "$out" ] 
	then
		return 0
	else
		return 1
	fi
}

echo "Waiting for mplayer windows.."
while true; do
	display
	check && remove
	sleep 3
done







