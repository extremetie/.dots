#!/bin/sh

threshold=10

check_battery() {
	if [ -f /sys/class/power_supply/BAT0/capacity ]; then
		bat_status=$(cat /sys/class/power_supply/BAT0/status)
		if [ $bat_status = 'Charging' ]; then
			return
		fi
		bat_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
		if [ $bat_capacity -lt $threshold ]; then
			notify-send "$bat_capacity% BAT"
		fi
	fi
}

while true; do
	check_battery
	sleep 60
done
