#!/usr/bin/env bash

echo "Showing android display"
scrcpy -b 16M --max-fps 30 --no-control --show-touches
if [[ $? -ne 0  ]];
then
	echo "Connect Phone and Enable adb son"
fi
