#!/usr/bin/env bash

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --country 'United Kingdom' -l 10 --sort rate --save /etc/pacman.d/mirrorlist


