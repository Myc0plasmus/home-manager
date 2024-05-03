#!/bin/sh
if xrandr --query | grep "HDMI-1 connected"
then
    xrandr --output HDMI-1 --auto --above eDP-1
else
    xrandr --output HDMI-1 --off
fi
