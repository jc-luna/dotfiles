#!/bin/sh

source ./cfg.sh

echo -e "Unforwarding port $ADBSYNC_PORT..."
adb forward --remove tcp:$ADBSYNC_PORT

echo -e "Removing rsync files from temporary directory..."
adb shell "rm /data/local/tmp/rsync*"

echo -e "Killing the adb server..."
adb kill-server

echo -e "Done!"
