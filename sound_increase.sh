#!/usr/bin/env bash

Sink_to_use=0
#check for default
SoundBlaster=$(pactl list sinks | grep -B 2 "USB_Sound_Blaster_HD" | grep "Sink" | cut -d "#" -f 2)

if [ -z "$SoundBlaster" ]
then
	#see where default laptop sheit is
	Laptop_Card=$(pactl list sinks | grep -B 3 "Built-in Audio Analog Stereo" | grep "Sink" | cut -d "#" -f 2)
	Sink_to_use=$Laptop_Card
else
	Sink_to_use=$SoundBlaster
fi	


# check what we want to do 
if [[ $1 = "increase" ]]
	then
		pactl set-sink-volume $Sink_to_use +5%	
	elif [[ $1 = "decrease" ]]
	then	
		pactl set-sink-volume $Sink_to_use -5%
	elif [[ $1 = "mute" ]]
	then	
		pactl set-sink-mute $Sink_to_use toggle
	else
		notify-send -t 1200 -u normal "sound_increase.sh: Something is wrong with the sound"
	fi	



#echo "sink to use is $Sink_to_use"