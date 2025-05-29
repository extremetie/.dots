#!/bin/sh

bat_dir=/sys/class/power_supply/BAT0

update_status() {
	# AUDIO
	wp_out=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
	audio="$(echo $wp_out | grep -Po '\d\.\d\d' | awk '{print $1 * 100}')%"
	if [ ${#wp_out} -gt 12 ]; then
		audio="$audio M"
	fi

	# BATTERY
	if [ -d $bat_dir ]; then
		battery="$(cat $bat_dir/capacity)%"
		if [ $(cat $bat_dir/status) = 'Charging' ]; then 
			battery="$battery C"
		else
			battery="$battery D"
		fi
	else
		battery='N/A'
	fi

	# CPU
	cpu="$(awk '{print $1 / 1000}' /sys/class/thermal/thermal_zone0/temp)°"
	cpu="$cpu $(awk '{print $1}' /proc/loadavg)"

	# DATETIME
	datetime=$(date '+%F %a %T')

	# OUTPUT
	status=" $audio │ $cpu │ $battery │ $datetime"
	xsetroot -name "$status"
}

while true; do
	update_status
	sleep 2
done
