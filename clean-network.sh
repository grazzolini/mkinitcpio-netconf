#!/usr/bin/ash

[ "$1" = "start" ] && exit 0

for link in $(ip link show up | grep '^[0-9]' | awk -F : '{print $2}'); do
	[ "$link" = "lo" ] && continue
	ip a flush dev $link
	ip link set dev $link down
done
