#!/bin/sh

# Battery monitor for my ASUS laptop.
# Run with cron or systemd timer.

BATTINFO=`acpi -b`
BATTPERC=`echo $BATTINFO | cut -f 4 -d " "`
BATTPERC=${BATTPERC%\%,}
BATTTIME=`echo $BATTINFO | cut -f 5 -d " "`

DISCHARGING=$(printf "Battery discharging: %s%%\nRemaining: %s" "$BATTPERC" "$BATTTIME")
CHARGING=$(printf "Battery charging: %s%%\nRemaining: %s" "$BATTPERC" "$BATTTIME")


if [[ `echo $BATTINFO | grep Discharging` && $BATTPERC < 22 ]]; then
	/usr/bin/notify-send -u critical -t 600000 "$DISCHARGING"
elif [[ `echo $BATTINFO | grep Charging` && $BATTPERC > 78 ]]; then
	/usr/bin/notify-send -u critical -t 600000 "$CHARGING"
fi
