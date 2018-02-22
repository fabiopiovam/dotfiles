#!/bin/bash

#Feed this script either:
#	"l" for laptop screen only,
#	"v" for vga screen only,
#	or "d" for dual vga/laptop.

d() { if [[ $(xrandr -q | grep VGA-1\ con) ]]
	then param $1
	else echo "No VGA input detected."
	fi ;}
dual() { xrandr --output VGA-1 --primary --mode 1280x1024 --pos 0x0 --rotate normal --output DVI-D-1 --off --output DP-1 --off --output LVDS-1 --mode 1024x600 --pos 0x1024 --rotate normal ;}
laptop() { xrandr --output LVDS-1 --auto --output VGA-1 --off ;}
vga() { xrandr --output VGA-1 --auto --output LVDS-1 --off ;}
#mirror() { xrandr --addmode VGA1 $lapres && xrandr --output LVDS1 --mode $lapres --output VGA1 --mode $lapres ;}

param() {
case $1 in
	d) dual ;;
	v) vga ;;
	l) laptop ;;
	*) echo -e "Invalid parameter. Add one of the following:\n\"d\" for dualscreen laptop and VGA.\n\"l\" for laptop only\n\"v\" for VGA only." ;;
esac ;}
d $1
