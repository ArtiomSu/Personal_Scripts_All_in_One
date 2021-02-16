#!/usr/bin/env dash

gather(){
	echo "CPU $(lscpu | grep "CPU MHz:" | sed "s/[ \t]*//g" | sed "s/CPUMHz://g") Mhz "
	sensors | grep °C | cut -f1 -d"("
	echo "-----------------------------------"
	nvidia-smi --query-gpu=name --format=csv,noheader | tr -d '\n'
	printf " Ver. "
	nvidia-smi --query-gpu=driver_version --format=csv,noheader
	printf "Core "
	nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader | tr -d '\n'
	printf "°C\nVRAM "
	nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | tr -d '\n'
	printf "/"
	nvidia-smi --query-gpu=memory.total --format=csv,noheader

	nvidia-smi --query-gpu=clocks.video --format=csv,noheader | tr -d '\n'
	printf " "
	nvidia-smi --query-gpu=clocks.mem --format=csv,noheader

	nvidia-smi --query-gpu=power.draw --format=csv,noheader
}

if [ ! -z $1 ]
then
	gather
else	
	while [ 1 -ne 2 ]
	do
		output="$(gather)"
		clear
		
		
		echo "$output"
		sleep 3
	done
fi

