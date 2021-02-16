#!/usr/bin/env bash


function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
   	 # clear screen
   	 echo -ne "\033[2J"
   	 output="$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S )"
     #figlet -f big "$output"
     toilet -F border -f big -t "$output"
     
     sleep 0.1
   done
}

total_seonds=0
function get_total_seconds(){
	input="$(grep -Eo '[[:alpha:]]+|[0-9]+' <<<"$1")"

	input=($input)



	check_number_re='^[0-9]+$'
	temp_number_storage=0
	multiply_by=1
	for item in ${input[*]}
	do
		if [[ $item =~ $check_number_re ]] 
		then
		   temp_number_storage=$item
		else
			if [[ $item = "h" ]] 
			then
				multiply_by=$(( 60 * 60 ))
			elif [[ $item = "m" ]]
			then
				multiply_by=60	
			else #second
				multiply_by=1
			fi

			total_seonds=$(( $total_seonds + $temp_number_storage * $multiply_by ))
			temp_number_storage=0

		fi
	    
	done

}

get_total_seconds $1
countdown $total_seonds

notify-send -t 4000 -u normal "$(echo -e "####################################\n#\t\t\t\tTimes up Motha Fucka\t\t\t\t#\n####################################")" &
echo -ne "\033[2J"
toilet -F border -f big -t "_DONE_"
2>/dev/null 1>&2 mpg123 ~/scrips/timer.mp3 &



#echo "total_seonds = $total_seonds"


#countdown $1