#!/bin/sh
cn=0
mkdir -p out
for s in '1' '2' '3' '4'
do
	case $s in
	"1")
		COL=Black
		;;
	"2")
		COL=Black
		;;
	"3")
		COL=Red
		;;
	"4")
		COL=Red
		;;
	esac
	
	
	for c in 'A' '2' '3' '4' '5' '6' '7' '8' '9' '10' 'J' 'Q' 'K'
	do
		convert -size 380x530 xc:transparent  \
          	-fill white -stroke black -strokewidth 2 -draw 'roundRectangle 2,2 376,526 20,20'\
          	-pointsize 150 -fill $COL -stroke none -annotate +16+142 "$c" \
          	-draw "image over 228,25 120,120 's$s.png'" \
          	-draw "image over 50,200 280,280 's$s.png'" \
          	+dither -colors 256 \
	  		out/card-$cn.png
		((cn=cn+1))
	done
done

