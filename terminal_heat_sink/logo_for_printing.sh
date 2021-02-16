#!/usr/bin/env zsh

term_width=$(tput cols)
term_height=$(tput lines)

echo 

background_colour=27
Heading_colour=250
x_colour=124
maximise_colour=41
minimise_colour=93
heat_sink_colour=248
heat_sink_colour_top=252
heat_sink_colour_bottom=246
paypal_colour=39
website_colour=208
github_colour=135
music_colour=33
video_title_colour=84

use_sleep=0

function my_sleep(){
	if [[ $use_sleep -eq 1 ]];then
		rnum=$((RANDOM%10000+1))
		num=$(echo "scale=2; $rnum/150000" | bc)
		num=0$num
		if [[ $num -eq "00" ]];then
			num=0.02
		fi	
		sleep $num
	fi
}

function box_and_pipes(){
	print -Pn "%K{$background_colour}  %K{$background_colour}"
	my_sleep
	print -Pn "%F{$Heading_colour}   T%F{202}e%F{161}r%F{10}m%F{45}i%F{160}n%F{9}a%F{123}l%F{46}_%F{91}H%F{40}e%F{226}a%F{5}t%F{198}_%F{135}S%F{44}i%F{15}n%F{197}k%F{$background_colour}"
	my_sleep
	for width in $(seq 1 $((term_width -30))); do	
		echo -en " "
		my_sleep
	done	
	print -Pn "%F{$minimise_colour}_ %F{$maximise_colour}◻ %F{$x_colour}x %F{$background_colour}"
	print -Pn " %k"
	my_sleep

	print -Pn "%K{$background_colour}  %k"
		for width in $(seq 1 $((term_width -3))); do	
		echo -en " "
		my_sleep
	done	
	print -Pn "%K{$background_colour} %k"
	my_sleep


	for height in $(seq 1 $((term_height -15)));do
		print -Pn "%K{$background_colour}  %k"

		stop_end=0
		for (( i = 1; i <= $term_width -5; i++ )); do 
			if [[ $i -eq 1 ]]; then
				echo -en "  "
			fi


			if [[ $height -eq 1 ]];then
						
				if (( i <= term_width -10 )); then
					print -Pn "%F{$heat_sink_colour_top} _ %F{$background_colour}"
						for space in $(seq 1 4);do
							if (( i <= $term_width -10)); then
								echo -en " "
								((i = i + 1))
							fi
						done	
						((i = i + 3))
				fi

				if (( i <= term_width -5)); then
							echo -en " "
				fi



			elif (( height <  term_height/3 )); then

				if (( i <= term_width -10 )); then
					print -Pn "%F{$heat_sink_colour}|%K{$heat_sink_colour} %k|%F{$background_colour}"
					for space in $(seq 1 4);do
						if (( i <= $term_width -10)); then
							echo -en " "
							((i = i + 1))
						fi
					done	

					((i = i + 3))
				fi

				if (( i <= term_width -5)); then
					echo -en " "
				fi


			elif (( height ==  (term_height/3) )); then	
				if (( i <= term_width -10 )); then
							
					if [[ stop_end -ne 1 ]]; then
						if ((  ( i + 7) >= (term_width -10) )); then
							((i = i + 3))
							stop_end=1
							print -Pn "%F{$heat_sink_colour_bottom}%K{$heat_sink_colour_bottom}  %k| %F{$background_colour}"
							continue
						else
							if [[ $i -eq 1 ]]; then
								print -Pn "%F{$heat_sink_colour_bottom}|%K{$heat_sink_colour_bottom}  %k%F{$background_colour}"
							else	
								print -Pn "%F{$heat_sink_colour_bottom}%K{$heat_sink_colour_bottom}   %k%F{$background_colour}"
							fi		
						fi	

						for space in $(seq 1 4);do
							if (( i <= $term_width -10)); then
								print -Pn "%F{$heat_sink_colour_bottom}%K{$heat_sink_colour_bottom} %k%F{$background_colour}"
								((i = i + 1))


							fi
						done	
						print -Pn "%F{$heat_sink_colour_bottom}%K{$heat_sink_colour_bottom} %k%F{$background_colour}"
						((i = i + 3))
					fi			

				fi

				if (( i <= term_width -5 && stop_end == 1 )); then
					echo -en " "
				fi	



			elif (( height ==  ((term_height/3)+2) )); then
				if [[ stop_end -eq 0 ]]; then
					print -Pn "%F{$website_colour}   https://artiomsu.github.io/%F{$background_colour}"
					stop_end=1
					((i = i + 29))
					my_sleep
				else
					echo -en " "
				fi

			elif (( height ==  ((term_height/3)+3) )); then
				if [[ stop_end -eq 0 ]]; then
					print -Pn "%F{$github_colour}   https://github.com/ArtiomSu/%F{$background_colour}"
					stop_end=1
					((i = i + 30))
					my_sleep
				else
					echo -en " "
				fi		

			elif (( height ==  ((term_height/3)+4) )); then
				if [[ stop_end -eq 0 ]]; then
					print -Pn "%F{$paypal_colour}   https://www.paypal.com/paypalme/artiomSudo%F{$background_colour}"
					stop_end=1
					((i = i + 44))
					my_sleep
				else
					echo -en " "
				fi	

			elif (( height ==  ((term_height/3)+6) )); then
				if [[ stop_end -eq 0 ]]; then
					print -Pn "%F{$video_title_colour}   New Shell Intro Demo%F{$background_colour}"
					stop_end=1
					((i = i + 22))
					my_sleep
				else
					echo -en " "
				fi

			elif (( height ==  ((term_height/3)+7) )); then
				if [[ stop_end -eq 0 ]]; then
					print -Pn "%F{$music_colour}   Chill. by Sakura Hz%F{$background_colour}"
					stop_end=1
					((i = i + 21))
					my_sleep
				else
					echo -en " "
				fi					
						
									
			else
				echo -en " "		
			fi

				
			my_sleep
		done	
		print -Pn "%K{$background_colour} %k"
		my_sleep
	done

	print -Pn "%K{$background_colour}  %k"
	for width in $(seq 1 $((term_width -3))); do	
		print -Pn "%K{$background_colour} %k"
		my_sleep
	done	
	print -Pn "%K{$background_colour} %k"
	my_sleep
}


function main(){
	if [[ ! -z $1 ]]; then
		if [[ $1 == "m" ]] || [[ $1 == "-m" ]]; then
			use_sleep=1
			play -v 0.1 -q /home/human/scrips/terminal_heat_sink/chill_sakura_hz.mp3 &
			box_and_pipes
			killall play
		else		
			use_sleep=1
			box_and_pipes
		fi	
	else
		box_and_pipes
	fi	
}

main $@