function check(){
	echo "checking #$1"
	if [ "$(ls -A "$1" 2>/dev/null | head -n 1)" == "" ]; then
		rm -r "$1"
	else
		echo "not empty"
	fi
}

# for D in $(find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n'); do
# 	echo "found $D" 
# 	check "$D";
# done

find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n' | while read D
do
    check "$D";
done


