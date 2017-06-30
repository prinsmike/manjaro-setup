#!/bin/sh

# Battery monitor for my ASUS laptop.
# Run with cron or systemd timer.

BATTINFO=`acpi -b`
BATTPERC=`echo $BATTINFO | cut -f 4 -d " "`
BATTPERC=${BATTPERC%\%,}
BATTTIME=`echo $BATTINFO | cut -f 5 -d " "`


if [[ `echo $BATTINFO | grep Discharging` && $BATTPERC < 22 ]]; then
	/usr/bin/notify-send -u critical -t 1200000 "Battery discharging: $BATTPERC%\nRemaining: $BATTTIME"
elif [[ `echo $BATTINFO | grep Charging` && $BATTPERC > 78 ]]; then
	/usr/bin/notify-send -u critical -t 1200000 "Battery charging: $BATTPERC%\nRemaining: $BATTTIME"
fi
