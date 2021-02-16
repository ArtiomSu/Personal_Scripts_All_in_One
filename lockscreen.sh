#!/usr/bin/env dash

# create lock file to avoid spam 
[ -f /tmp/screenlock.sh.lock ] && exit 0
touch /tmp/screenlock.sh.lock



scrot /tmp/screen.png
echo "screenshot taken"
#convert /tmp/screen.png -paint 2 /tmp/screen.png
#convert /tmp/screen.png ~/Pictures/login-screen/default_user.png -gravity center -composite -matte /tmp/screen.png

#i3lock -u -e -i /tmp/screen.png






# black and white but distorted
#convert /tmp/screen.png -charcoal 2 /tmp/screen.png

#convert /tmp/screen.png -contrast /tmp/screen.png

# pretty cool changes all the colours
#convert /tmp/screen.png -cycle 100 /tmp/screen.png

#uselss
#convert /tmp/screen.png -dither Riemersma /tmp/screen.png

# pretty cool gives wacky colors but takes ages to apply
#convert /tmp/screen.png -edge 20 /tmp/screen.png

#not to bad but not good
#convert /tmp/screen.png -emboss 20 /tmp/screen.png

# flips image upside down pretty cool
#convert /tmp/screen.png -flip /tmp/screen.png

#cpu heavy lol prob use bigger radious also if needed
#convert /tmp/screen.png -gaussian-blur 20 /tmp/screen.png

# pretty cool suxks image into the center
#convert /tmp/screen.png -implode 0.3 /tmp/screen.png

# pretty cool but will need sum blur or something lol
#80% brightness, max saturation, shift hue by 180 degrees
#convert /tmp/screen.png -modulate 80,200,180 /tmp/screen.png

# not bad reduces colours a bit
#convert /tmp/screen.png -posterize 4 /tmp/screen.png

# uses too much cpu lol just black and white lines
#convert /tmp/screen.png -sketch 20 /tmp/screen.png

# makes black white and white black
#convert /tmp/screen.png -solarize 10 /tmp/screen.png

#
#
#
##
# awesome effect blurry like water and is fast af lol
#convert /tmp/screen.png -spread 10 /tmp/screen.png
##
#
#
#

# not bad not great simple swirl
#convert /tmp/screen.png -swirl 90 /tmp/screen.png

# makes it dark af
#convert /tmp/screen.png -tint 40 /tmp/screen.png








#convert /tmp/screen.png -cycle 100 /tmp/screen.png
#convert /tmp/screen.png -flip /tmp/screen.png
#80% brightness, max saturation, shift hue by 180 degrees
#convert /tmp/screen.png -modulate 80,200,180 /tmp/screen.png






number=$(shuf -i1-14 -n1)
#message=$(echo $"lock screen\nlaunching type $number")
notify-send "lock screen" "launching type $number"
case $number in
	1)
		convert /tmp/screen.png -paint 2 /tmp/screen.png
		;;
	2)
		convert /tmp/screen.png -spread 10 /tmp/screen.png
		;;
	3)
		convert /tmp/screen.png -paint 2 -modulate 80,200,180 /tmp/screen.png
		;;
	4)
		convert /tmp/screen.png -spread 20 -modulate 80,200,180 /tmp/screen.png
		;;
	5)
		convert /tmp/screen.png -paint 6 -spread 5 -modulate 30,90,10 /tmp/screen.png
		;;
	6)
		convert /tmp/screen.png -paint 1 -spread 25 -modulate 150,5,190 /tmp/screen.png
		;;	
	7)
		convert /tmp/screen.png -paint 4 -modulate 120,20,90 /tmp/screen.png
		;;	
	8)
		convert /tmp/screen.png -spread 10 -cycle 50 /tmp/screen.png
		;;
	9)
		convert /tmp/screen.png -spread 10 -paint 2 /tmp/screen.png
		;;
	10)
		convert /tmp/screen.png -paint 2 -spread 10  /tmp/screen.png
		;;
	11)
		convert /tmp/screen.png -paint 3 -spread 10 -modulate 150,190,180 /tmp/screen.png
		;;
	12)
		convert /tmp/screen.png -spread 20 -paint 3  -modulate 60,140,120 /tmp/screen.png
		;;
	13)
		convert /tmp/screen.png -spread 20 -paint 4  -modulate 190,80,260 /tmp/screen.png
		;;			
	*)
      convert /tmp/screen.png -spread 30 -paint 5 -modulate 200,200,350 /tmp/screen.png
        ;;	
esac


i3lock -u -e -i /tmp/screen.png

rm -f /tmp/screenlock.sh.lock

#ristretto  /tmp/screen.png

rm /tmp/screen.png
