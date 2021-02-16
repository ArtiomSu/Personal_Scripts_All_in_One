#!/usr/bin/env bash

#results=$(xdotool search --onlyvisible --class "TelegramDesktop")
results=$(xdotool search --onlyvisible --class "Bettergram")



echo $results

text="testing test"

arr=($text)


How_many_times_to_spam=10

MIN_delay=70
MAX_delay=400

#MIN_delay=10
#MAX_delay=20

spam_sent_count=0

function spam {
	for id in $results
	do
		#check for proper window
		#xdotool windowfocus $id
		#if [ $? -ne 0 ] 
		#then
	   # 	echo "window is fuked trying next one"
	   # 	continue
	   # fi

		for line in ${arr[@]}
		do
			xdotool type --window $id $line
			if [ $? -ne 0 ] 
			then
	    		echo "window is fuked trying next one"
	    		break
	    	fi 
	    	milliseconds=$(( $RANDOM % $MAX_delay + $MIN_delay ))
	    	spam_sent_count=$(( $spam_sent_count + 1 ))
	    	#echo "delaying for $milliseconds"
	    	xdotool key --window $id --delay $milliseconds Return


			#echo "line is $line"
		done	
	#xdotool type --window 58720262 'helloo there\n'
	#check for right windwo
	# xdotool windowfocus 58720262 works but focuses sheit
	#echo "id is $id"
	done	
}

catch_end() {
	echo ":)"
    echo "total spam sent $spam_sent_count"
    exit 0
}

trap 'catch_end' SIGINT

while [ $How_many_times_to_spam -gt 0 ]
do
	spam

	How_many_times_to_spam=$(( $How_many_times_to_spam - 1 ))
done
echo "total spam sent $spam_sent_count"

