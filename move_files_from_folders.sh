#!/usr/bin/env bash

Green='\033[0;32m'
NC='\033[0m'
Purple='\033[0;35m'
LightBlue='\033[1;34m'

random_ending(){
	chars=abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ
	for i in {1..8} ; do
    	echo -n "${chars:RANDOM%${#chars}:1}"
	done
	echo
}

if [ "$1" == "-h" ];
then
	echo "$0 moves all files that are inside the current directory's folders to the current directory."
	echo "For Example"
	echo "if you have the following layout"
	echo "t0/t0.txt t1/t1.txt t2.txt"
	echo "after running $0 you will have the layout as so"
	echo "t0 t1 t0.txt t1.txt t2.txt"
	echo ""
	echo "if there are conflics after the move. The script will create a random genereated name after .rename and will list all the conflicts after moving the files"

	exit 0
fi

path="$(pwd)"
for entry in "$path"/*
do
	if [ -d "$entry" ];
	then
		for file in "$entry"/*
		do
			#echo -e "$Green file is $file $NC"
			if [ -f "$file" ];
			then
				file_name="$(basename "$file")"
				#echo -e "$Purple file_name is $file_name $NC"
				if [ -f "$path/$file_name" ];
				then
					echo "file exists need to rename"
					echo "moving $path/${file_name}.rename"
					mv "$file" "$path/${file_name}.rename$(random_ending)"
					echo ""
				else
					echo -e "$LightBlue moving $path/$file_name $NC"
					mv "$file" "$path/${file_name}"
					echo ""
				fi
			fi
		done
	fi
done


echo "You will need to rename the following files as there were conflicts"
for entry in "$path"/*.rename*
do 
	if [ -f "$entry" ];
	then
		echo $entry
	fi
done
