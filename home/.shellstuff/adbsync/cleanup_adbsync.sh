#!/bin/sh

source ./cfg.sh

echo -e "Unforwarding port $ADBSYNC_PORT..."
adb forward --remove tcp:$ADBSYNC_PORT

echo -e "Killing the adb server..."
adb kill-server

echo -e "Done!"
