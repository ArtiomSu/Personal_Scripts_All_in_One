#!/usr/bin/env bash

# output=$(audtool --playback-status)

# #echo $output
# case $output in
# 	"playing")
# 		audacious -e "$@"
# 		#echo "do nothing"
# 		;;
# 	"paused")
# 		audacious -e -t "$@"
# 		#echo "resume play"
# 		;;
# 	*)
#       	audacious -e -p "$@"
#       	#echo "start playing"
#         ;;	
# esac


smplayer -add-to-playlist "$@"