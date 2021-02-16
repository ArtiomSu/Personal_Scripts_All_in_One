#!/usr/bin/env bash

# note to use this make sure you cd into the directory you want to rename files in

for entry in "$(pwd)"/*
do
	echo "renaming $entry"
	# this looks for files that have S01E01 format also lower case will work
	# returns episode number 0-49 or so since there really shouldnt be more than 49 episodes in a season lol
	episode="$(echo "$entry" | grep -o "[s,S][0-2][0-9][e,E][0-4][0-9]" | grep -o "[e,E][0-4][0-9]" | sed "s/[e,E]//g" | sed "s/^0//g" )"
	echo "episode is $episode"
	# this looks for anything after the last "." will return something like ".mkv"
	extension="$(echo "$entry" | grep -o "\.[a-Z]*$")"
	echo "extension is $extension"
	
	# checks is episode and season matched correctly and renames
	if [[ ! -z $episode ]] && [[ ! -z $extension  ]]; then
		#echo "rename is possible"
		newname="$(pwd)/${episode}${extension}"
		#echo "renaming to $newname"
		mv "$entry" "$newname"
	else
		echo "could not rename file $entry"
	fi
	echo -e "done \n\n"
done


