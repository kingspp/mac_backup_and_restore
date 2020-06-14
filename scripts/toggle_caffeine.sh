#!/bin/bash

status=$(ps -ef | grep caffeinate | awk '{print $2}'  ORS=" ")
status_arr=($status)

if [[ ${#status_arr[@]} -gt 1 ]];then
	echo "caffeinate running . . ."
	kill -9 $status
else
	echo "caffeinate off"
	caffeinate -d &
fi

