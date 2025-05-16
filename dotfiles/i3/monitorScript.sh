#!/bin/sh
if xrandr --query | grep "HDMI-1 connected"
then
    xrandr --output HDMI-1 --auto --right-of eDP-1
else
    xrandr --output HDMI-1 --off
fi
