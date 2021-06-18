#!/bin/bash

docker run -d --name qq \
--device /dev/snd --ipc=host \
-v "/home/nagae-memooff/文档/Tencent Files":/TencentFiles \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e XMODIFIERS=@im=ibus \
-e QT_IM_MODULE=ibus \
-e GTK_IM_MODULE=ibus \
-e DISPLAY=unix$DISPLAY \
-e AUDIO_GID=`getent group audio | cut -d: -f3` \
-e VIDEO_GID=`getent group video | cut -d: -f3` \
-e GID=`id -g` \
-e UID=`id -u` \
nagae-memooff/qq:9.1.8
