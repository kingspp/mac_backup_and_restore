#!/bin/bash
dnd=$(defaults -currentHost read com.apple.notificationcenterui doNotDisturb)

if [ "$dnd" == "0" ]; then	
	defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean true
    defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturbDate -date "`date -u +\"%Y-%m-%d %H:%M:%S +0000\"`"
    killall NotificationCenter
else 	
 	defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean false
    killall NotificationCenter
fi