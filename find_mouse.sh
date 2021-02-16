#!/usr/bin/env bash

coordinates=$(xrandr --query | grep '\bprimary\b' | cut -d ' ' -f4)
echo "$coordinates"

# 3440x1440+4920+1064
			#start of primary screen

mon_size=$(echo $coordinates | cut -d '+' -f1)
echo $mon_size
mon_size_x=$(echo $mon_size | cut -d 'x' -f1)
echo $mon_size_x
mon_size_y=$(echo $mon_size | cut -d 'x' -f2)
echo $mon_size_y

coordinates_start_x=$(echo $coordinates | cut -d '+' -f2)
coordinates_start_y=$(echo $coordinates | cut -d '+' -f3)

echo "Mon size is $mon_size_x by $mon_size_y and pixels start at $coordinates_start_x , $coordinates_start_y"

mouse_location_x=$(( $coordinates_start_x + $mon_size_x / 2 ))
mouse_location_y=$(( $coordinates_start_y + $mon_size_y / 2 ))

echo "mouse will be moved to $mouse_location_x , $mouse_location_y"

xdotool mousemove $mouse_location_x $mouse_location_y


#notify-send -t 1800 "$(echo -e "$0\nmouse should now be in the middle")"
