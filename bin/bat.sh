#!/bin/sh

if [ -d /sys/class/power_supply/BAT0 ]; then
	output="$(cat /sys/class/power_supply/BAT0/capacity)% $(cat /sys/class/power_supply/BAT0/status)"
else
	output='N/A'
fi

echo $output
