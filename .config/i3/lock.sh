#!/usr/bin/env bash

icon="$HOME/Pictures/unnamed.png"
tmpbg="$HOME/Pictures/beautiful-nature-wallpaper-3d.jpg

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
