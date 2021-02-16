#!/usr/bin/env dash

veracrypt=$(df -h --output=avail,source,target | grep veracrypt1 | tr -s ' ' | cut -d" " -f 2)

root=$(df -h --output=avail,source,target | grep archvg-root | tr -s ' ' | cut -d" " -f 2)

tmp=$(df -h --output=avail,source,target | grep /tmp | tr -s ' ' | cut -d" " -f 2)

oneTBssd=$(df -h --output=avail,source,target | grep "1tbssd" | tr -s ' ' | cut -d" " -f 2)

temp=$(df -h --output=avail,source,target | grep temp | tr -s ' ' | cut -d" " -f 2)

twotbssd=$(df -h --output=avail,source,target | grep 2tbssd | tr -s ' ' | cut -d" " -f 2)

nasMusic=$(df -h --output=avail,source,target | grep "/nas/nfs-music" | tr -s ' ' | cut -d" " -f 2)

nasGames=$(df -h --output=avail,source,target | grep "/nas/nfs-games" | tr -s ' ' | cut -d" " -f 2)

nasMovies=$(df -h --output=avail,source,target | grep "/nas/nfs-movies" | tr -s ' ' | cut -d" " -f 2)

nasDump=$(df -h --output=avail,source,target | grep "/nas/nfs-dump" | tr -s ' ' | cut -d" " -f 2)

eighthdd=$(df -h --output=avail,source,target | grep "/nas/nfs-8tbhdd" | tr -s ' ' | cut -d" " -f 2)

fivetbhdd=$(df -h --output=avail,source,target | grep "/media/5tbhdd" | tr -s ' ' | cut -d" " -f 2)

final_output=""



if [ ! -z "$root" ]; then
	final_output="$final_output "root:"$root""|"
fi	

if [ ! -z "$tmp" ]; then
	final_output="$final_output"tmp:"$tmp""|"
fi	

if [ ! -z "$temp" ]; then
	final_output="$final_output"temp:"$temp""|"
fi	

if [ ! -z "$veracrypt" ]; then
	final_output="$final_output"veracrypt1:"$veracrypt""|"
fi	

if [ ! -z "$oneTBssd" ]; then
	final_output="$final_output"1tb-ssd:"$oneTBssd""|"
fi	

if [ ! -z "$twotbssd" ]; then
	final_output="$final_output"2tbssd:"$twotbssd""|"
fi	

if [ ! -z "$fivetbhdd" ]; then
	final_output="$final_output"5tbhdd:"$fivetbhdd""|"
fi

if [ ! -z "$nasMusic" ]; then
	final_output="$final_output"Nmusic:"$nasMusic""|"
fi	

if [ ! -z "$nasGames" ]; then
	final_output="$final_output"Ngames:"$nasGames""|"
fi	

if [ ! -z "$nasMovies" ]; then
	final_output="$final_output"Nmovies:"$nasMovies""|"
fi	

if [ ! -z "$eighthdd" ]; then
	final_output="$final_output"N8tbhdd:"$eighthdd""|"
fi	

if [ ! -z "$nasDump" ]; then
	final_output="$final_output"Ndump:"$nasDump"""
fi	

echo $final_output
