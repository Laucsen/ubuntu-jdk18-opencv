#!/bin/bash

apt-get update -y
apt-get install -y \
  libjpeg8 \
  libpng16-16 \
  libtiff5 \
  libdc1394-22 \
  libavcodec58 \
  libavformat58 \
  libswscale5 \
  ffmpeg
