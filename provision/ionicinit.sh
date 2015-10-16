#!/bin/bash

sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices

wwwdir=/git/moodlemobile2

cd $wwwdir

ionic serve --address 192.168.33.5
