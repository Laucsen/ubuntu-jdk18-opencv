#!/bin/bash

# Tools
tools=(build-essential cmake curl libgtk2.0-dev pkg-config libv4l-dev libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev ant)
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata ${tools[@]} 

# OpenCV
curl -sL https://github.com/Itseez/opencv/archive/4.5.1.tar.gz | tar xvz -C /tmp

cd /tmp/opencv-4.5.1 && mkdir build && cd build

export JAVA_HOME=/opt/jdk-18
export ANT_HOME=/usr/bin/ant

export OPENCV_HOME=/tmp/opencv-4.5.1
export OPENCV_JAR=/tmp/opencv-4.5.1/build/bin
export OPENCV_LIB=/tmp/opencv-4.5.1/build/lib

cmake \
  -D BUILD_SHARED_LIBS=OFF \
  -D ANT_EXECUTABLE:FILEPATH=/usr/share/ant/bin/ant \
  .. 
make -j8

mkdir /opencv-java-bin
cp bin/opencv-451.jar /opencv-java-bin
cp lib/libopencv_java451.so /opencv-java-bin

# Clean Up
apt-get remove --purge -y ${tools[@]} && apt-get autoclean && apt-get -y autoremove && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
