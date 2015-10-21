#!/bin/bash

sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices

wwwdir=/git/moodlemobile2

cd $wwwdir

echo "That's all folks!"
echo "You Vagrant is now running"
echo "You can now open your browser while ionic starts!"

ionic serve --address 192.168.33.5
