#!/bin/sh
if [[ $1 -eq 1 ]] 
then
	xrandr --output eDP1 --rotate right
	xrandr --output eDP1 --scale 1.5x1.5
elif [[ $1 -eq 2 ]] 
then
	xrandr --output eDP1 --rotate normal
	xrandr --output eDP1 --scale 1x1
elif [[ $1 -eq 3 ]] 
then
	xrandr --output eDP1 --rotate left
	xrandr --output eDP1 --scale 1.5x1.5
fi		

