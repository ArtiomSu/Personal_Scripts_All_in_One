if [[ -z "$1" ]]; then
	echo "provide an arguement like txt or mkv or mp4"
else
	echo "delete"	
	find . -type f ! -name "*.$1" -delete
fi
