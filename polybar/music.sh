#!/usr/bin/env bash

audtool --current-song >/dev/null



if [ $? = 0 ]
then	
output=$(echo "$(audtool --playback-status) $(audtool --current-song-tuple-data title) by $(audtool --current-song-tuple-data artist) ( $(audtool --current-song-bitrate-kbps) kbps )  $(audtool --current-song-output-length)/$(audtool --current-song-length)")

echo $output
else
	echo ""
fi	