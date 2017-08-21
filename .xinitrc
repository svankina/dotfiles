#!/bin/sh
xrandr --output VGA-1 --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --above VGA-1
nitrogen --restore &
exec i3
xcape -e 'Control_R=Escape' -t 175

