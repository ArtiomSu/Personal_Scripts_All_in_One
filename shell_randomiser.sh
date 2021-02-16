#!/usr/bin/env zsh

if [[ "$1" == "-h" ]]; then
	echo "-b will not set a background image"
	echo "-t won't use toiler output for prompt"
	echo "-n won't use a background image and won't use toilet"
	exit 0
fi

clear
alias clear="clear && tput cup 0 2"

if [[ "$1" == "-b" ]] || [[ "$1" == "-n" ]];then
	#do noting
else
	kitty +kitten icat -z -1 --align left $(ls ~/Pictures/*.jpg |sort -R |tail -1)
fi

tput cup 0 2
PS1=''

catch_ctrl_c(){
	main_loop
}

trap 'catch_ctrl_c' SIGINT

main_loop(){
	while [ true ]; do
	print -Pn "%F{$(( RANDOM % 254 ))}"
	read -r t
	clear
	
	if [[ "$1" != "-b" ]] && [[ "$1" != "-n" ]];then
		kitty +kitten icat -z -1 --align left $(ls ~/Pictures/*.jpg |sort -R |tail -1)
		tput cup 0 2
	fi


	if [[ "$1" == "-t" ]] || [[ "$1" == "-n" ]];then
		echo $t
	else
		tput cup 1 0
		toilet -f big -F rainbow $t
	fi

	print -Pn "%F{$(( RANDOM % 254 ))}"
	if [[ "$t" == "exit" ]]; then
		clear
		exit 0
	fi
	eval $t 2>/dev/null
	tput cup 0 2
	
done
}

main_loop $1
