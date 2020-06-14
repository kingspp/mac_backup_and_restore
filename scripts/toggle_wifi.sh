#!/bin/bash
wifi=$(networksetup -getairportpower en0 | awk '{print $4}')

if [ "$wifi" == "On" ]; then
	echo "WIFI ON"
	networksetup -setairportpower en0 off
else
 	echo "WIFI OFF"
 	networksetup -setairportpower en0 on
fi

