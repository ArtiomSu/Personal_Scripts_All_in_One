#!/usr/bin/env dash

if [ -z "$1" ]
then
	echo "usage: $0 https://url_for_git_repo"
	exit 0
fi

trim_link="$(echo $1 | sed "s/https:\/\/github.com\///g")"

echo "$trim_link"

sizeinkb="$(curl -s https://api.github.com/repos/${trim_link} | grep size | cut -d ":" -f2 | sed "s/[ ,,]//g" | head -n1)"
echo "$sizeinkb KB"
echo "$( expr $sizeinkb / 1000 ) MB"
echo "$( expr $sizeinkb / 1000000 ) GB"
