#!/bin/bash

youtube-dl -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --prefer-ffmpeg $1

#youtube-dl -x --audio-format wav --audio-quality 0 --prefer-ffmpeg $1