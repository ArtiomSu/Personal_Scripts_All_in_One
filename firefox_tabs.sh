#!/usr/bin/env bash
output="$(xclip -selection clipboard -o)"

url_found=false
contents=""

for url in $output;
do
	if [[ "$url" == *"http"* ]]; then
		url_found=true
	  	contents="${contents}firefox --new-tab $url\n"
	  	echo "$url"
	fi
done

if [ "$url_found" = true ] ; then
    echo "generating to $fileName"
    fileName="firefox_$(date +"%d-%m-%y-%T").sh"
    mkdir -p ./scrips/firefox_tabs
	cd ./scrips/firefox_tabs
    echo "#!/usr/bin/env bash" > $fileName
    echo -e "$contents" >> $fileName
    chmod +x $fileName
fi

# do l for list filenames only, ll to list all urls per filename.
# do 1 to select latest one and so on...
# show menu and allow to select