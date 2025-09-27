# `adb` and `rsync`

[Based off of this blog post by David Sebek](https://howtos.davidsebek.com/android-rsync-adb.html),
chosen over purely using `rsync`
due to the warning regarding certain metadata that's on the top of
[this post](https://howtos.davidsebek.com/android-rsync-termux.html).

There are a lot of cases where I want to transfer files over my phone,
but not through mtp.
This directory has utilities related to this end.
