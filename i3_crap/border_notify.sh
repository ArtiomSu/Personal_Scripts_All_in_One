#!/usr/bin/env zsh

sleeptime=0.02

max_border=30 
increment=5

number_of_boops=3

default_size=1

function resize {
	i3-msg border pixel $1 >/dev/null
}

while [ $number_of_boops -gt 0 ]
	do
		counter=$(( $default_size + $increment ))
		while [ $counter -lt $max_border ]
		do
			resize $counter
			counter=$(( $counter + $increment ))
			sleep $sleeptime
		done

		while [ $counter -gt $default_size ]
		do
			resize $counter
			counter=$(( $counter - $increment ))
			sleep $sleeptime
		done

	number_of_boops=$(( $number_of_boops - 1 ))
	done	

resize $default_size

