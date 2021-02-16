#!/usr/bin/env bash

Green='\033[0;32m'
NC='\033[0m'

random_name=$(</dev/urandom tr -dc 'A-Za-z0-9()+.=[]_{}' | head -c 30 ; echo)

file=${@}

url=$(curl -F name=${random_name} -F file=@"$file" http://tmp.ninja/api.php\?d\=upload-tool)

echo -e "\n\nyour url is $Green$url$NC"

