#!/usr/bin/env bash

# Battery monitor for my ASUS laptop.
# Run with cron or systemd timer.

BATTINFO=$(acpi -b)
BATTPERC=$(echo $BATTINFO | cut -f 4 -d " ")
BATTPERC=${BATTPERC%\%,}

if [[ $(echo $BATTINFO | grep -i 'discharging') && $BATTPERC -le 20 ]]; then
	MSG=$(printf "Battery Critical! %s%%" "$BATTPERC")
	/usr/bin/notify-send -u critical -t 600000 -i battery-low "$MSG"
elif [[ $(echo $BATTINFO | grep -i 'discharging') && $BATTPERC -lt 45 ]]; then
	MSG=$(printf "Battery discharging. %s%%" "$BATTPERC")
	/usr/bin/notify-send -u normal -t 15000 -i battery-low "$MSG"
fi

