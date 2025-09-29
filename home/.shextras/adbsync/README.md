# `adb` and `rsync`

[Based off of this blog post by David Sebek](https://howtos.davidsebek.com/android-rsync-adb.html),
chosen over purely using `rsync` over Termux
due to the warning regarding certain metadata that's displayed on the top of
[this post](https://howtos.davidsebek.com/android-rsync-termux.html).

There are a lot of cases where I want to transfer files over my phone,
but not through mtp.
This directory has utilities related to this end.

## Script Usage
To use these scripts,
you need to have a statically compiled version of `rsync` for your phone's architecture
in the working directory of these script.
See the blogpost for more details.
It should also be named `rsync-aarch64` because I uhhh it's my architecture and uhhhhhhh im assuming here!!

Additionally,
you will need to make a new file named `cfg.sh`
and export a variable for the port that you want the rsync daemon to be on.

```sh
echo "export ADBSYNC_PORT=port_for_rsyncd" > cfg.sh
```

### `init_rsync.sh`
Pushes a copy of your `rsync` into a temp directory on your phone,
namely `/data/local/tmp`,
forwards a port in adb,
and creates an `rsyncd` config.

### `cleanup_rsyncd`
Unforwards ports,
cleans up the temporary directory,
and kills the adb server.
