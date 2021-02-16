#!/bin/sh

if [[ $1 = "quad" ]]
	then
		Command="xrandr --output HDMI-0 --mode 2560x1080 --pos 3840x475 --rotate left --output DP-0 --mode 3840x2160 --pos 0x675 --rotate normal --output DP-1 --primary --mode 3440x1440 --pos 4920x1035 --rotate normal -r 100 --output DP-2 --off --output DP-3 --mode 3840x2160 --pos 8360x0 --rotate right --output DP-4 --off"
	elif [[ $1 = "triple" ]]
	then	
		Command="echo 'triple not supported yet'"
	elif [[ $1 = "single" ]]
	then	
		Command="echo 'single not supported yet'"
	elif [[ $1 = "one" ]]
	then	
		Command="echo 'one not supported yet'"	
	fi	

eval $Command

