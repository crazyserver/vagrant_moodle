#!/bin/bash

sudo add-apt-repository -y ppa:webupd8team/java > /dev/null
sudo add-apt-repository -y ppa:rwky/nodejs > /dev/null #Version 0.12.7 of nodejs
sudo apt-get update > /dev/null

echo 'Installing Node.js'
sudo apt-get install -y --force-yes python-software-properties python g++ make nodejs > /dev/null
#npm is included in nodejs on rwky package
#sudo ln -s /usr/bin/nodejs /usr/local/bin/node #Not needed anymore

echo 'Installing Android SDK'
ANDROID_SDK_FILENAME=android-sdk_r24-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME
homedir=/home/vagrant

sudo apt-get install -y --force-yes git openjdk-7-jdk ant expect > /dev/null

pushd $homedir
curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME > /dev/null
sudo chown -R vagrant android-sdk-linux/
rm $ANDROID_SDK_FILENAME
popd

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc

sudo npm config set strict-ssl false > /dev/null
sudo npm cache clean > /dev/null

echo 'Installing iojs'
sudo npm install -g n > /dev/null
sudo n 0.12.7 > /dev/null
sudo n rm 4.2.1 > /dev/null

echo 'Installing Cordova'
sudo npm install -g cordova > /dev/null
echo 'Installing Ionic'
sudo npm install -g ionic > /dev/null

echo 'Update Android SDK'
sudo expect -c '
set timeout -1   ;
spawn '$homedir'/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-19,build-tools-19.1.0
expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
' > /dev/null

echo 'Installing Saas'
sudo gem install sass > /dev/null
sudo npm install -g node-sass > /dev/null

echo 'Installing Shifter'
sudo npm install shifter@0.4.6 -g > /dev/null

echo 'Installing Bower'
sudo npm install -g bower > /dev/null

echo 'Installing Gulp'
sudo npm install -g gulp > /dev/null