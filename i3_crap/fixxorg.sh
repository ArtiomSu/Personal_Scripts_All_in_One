#!/usr/bin/env dash

xrandr --output HDMI-0 --mode 2560x1080 --pos 3840x475 --rotate left --output DP-0 --mode 3840x2160 --pos 0x559 --rotate normal --output DP-1 --primary --mode 3440x1440 --pos 4920x866 --rotate normal --output DP-2 --off --output DP-3 --mode 3840x2160 --pos 8360x0 --rotate right --output DP-4 --off
sleep 2
xrandr --dpi 100
sleep 1
~/scrips/screen_organise.sh quad
