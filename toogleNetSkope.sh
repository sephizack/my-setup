#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

mv "/Applications/Netskope Client.app" "/Applications/Netskope Client 2.app" > /dev/null 2>&1
if [ "$?" -eq 0 ]; then
	# It was enabled
	echo "Netskope hidden, killing current process ..."
	# pkill -9 -f "Netskope Client.app/Contents/MacOS/Netskope Client"
	pkill -9 -f "etskope"
	sleep 3
else
	# It is disabled
	mv "/Applications/Netskope Client 2.app" "/Applications/Netskope Client.app"
	echo "Netskope re-enabled"
	sleep 1
fi

# Restart wifi
echo "Restarting Wifi ..."
networksetup -setairportpower en0 off
sleep 1
networksetup -setairportpower en0 on
echo "OK !"