#!/usr/bin/env bash

#Up)      xdotool mousemove_relative -- 0 -15
#Down)  xdotool mousemove_relative 0 15
#Right)   xdotool mousemove_relative 15 0
#Left)     xdotool mousemove_relative -- -15 0

BOX_SIZE=100
SPEED=5
INCREMENT=2

function move {
	if [[ $1 = "right" ]]
	then
		Command="xdotool mousemove_relative $SPEED 0"
	elif [[ $1 = "left" ]]
	then	
		Command="xdotool mousemove_relative -- -$SPEED 0"
	elif [[ $1 = "up" ]]
	then	
		Command="xdotool mousemove_relative -- 0 -$SPEED"
	elif [[ $1 = "down" ]]
	then	
		Command="xdotool mousemove_relative 0 $SPEED"			
	fi	

	Loop_count=$2
	while [ $Loop_count -gt 0 ]
	do
		#echo "$Loop_count"
		eval $Command
		Loop_count=$(( $Loop_count - 1 ))
	done	
}  


function run {
	run_count=$BOX_SIZE
	move up $(( $run_count / 2 ))
	move right $(( $run_count / 2 ))
	move down $run_count
	move left $run_count
	move up $run_count
	run_count=$(( $run_count - $INCREMENT ))
	while [ $run_count -gt 0 ]
	do
		#xdotool mousemove_relative $SPEED 0
		move right $run_count
		move down $(( $run_count - $INCREMENT ))
		move left $(( $run_count - $INCREMENT * 2 ))
		move up $(( $run_count - $INCREMENT * 3 ))

		#move right $BOX_SIZE
		#move down $BOX_SIZE
		#move left $BOX_SIZE
		#move up $BOX_SIZE

		echo "$run_count"

		run_count=$(( $run_count - $INCREMENT * 4 ))
		#BOX_SIZE=$(( $BOX_SIZE - $INCREMENT ))

	done
}

function run_reverse {
	eval $(xdotool getmouselocation --shell)
	X_position=$X
	Y_position=$Y
	reverse_count=1
	while [ $reverse_count -lt $BOX_SIZE ]
	do
		#xdotool mousemove_relative $SPEED 0
		move right $reverse_count
		move down $(( $reverse_count + $INCREMENT ))
		move left $(( $reverse_count + $INCREMENT * 2 ))
		move up $(( $reverse_count + $INCREMENT * 3 ))

		#move right $BOX_SIZE
		#move down $BOX_SIZE
		#move left $BOX_SIZE
		#move up $BOX_SIZE

		echo "$reverse_count"

		reverse_count=$(( $reverse_count + $INCREMENT * 4 ))
		#BOX_SIZE=$(( $BOX_SIZE - $INCREMENT ))

	done
	xdotool mousemove $X_position $Y_position

}

run

run_reverse

