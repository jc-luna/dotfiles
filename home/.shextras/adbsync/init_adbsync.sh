#!/bin/sh

# For ADBSYNC_PORT
source ./cfg.sh

echo "Pushing an rsync copy into temporary directory..."
adb push rsync-aarch64 /data/local/tmp/rsync

echo "Forwarding port $ADBSYNC_PORT on the connected Android device and this computer..."
adb forward tcp:$ADBSYNC_PORT tcp:$ADBSYNC_PORT

echo "Starting up the rsync server on the connected Android device..."
adb shell "cd /data/local/tmp && echo -e 'address = 127.0.0.1\nport = $ADBSYNC_PORT\n\n[root]\npath = /\nuse chroot = false\nread only = false' > ./rsyncd.conf && echo -e '\nThe rsync daemon config:' && cat ./rsyncd.conf && sleep 1"

#echo "starting server"
#adb shell "cd /data/local/tmp && ./rsync --daemon --detach --config=./rsyncd.conf"
