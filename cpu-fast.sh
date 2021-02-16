#!/bin/env bash

#toilet -f big -t " CPU POWER "
echo "increasing cpu frequency"

sudo cpupower frequency-set -g performance

sudo cpupower frequency-set -u 4.7Ghz

sleep 3