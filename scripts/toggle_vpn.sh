#!/bin/bash
ip=$(piactl get vpnip)

if [ "$ip" == "Unknown" ]; then
	echo "VPN OFF"
	piactl connect
else
 	echo "VPN ON"
 	piactl disconnect
fi