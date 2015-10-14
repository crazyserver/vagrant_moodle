#!/bin/bash

source "/vagrant/provision/functions.sh"

echo 'Provision MoodleMobile2'

wwwdir=/git/moodlemobile2

pushd $wwwdir
echo 'Ionic State Restore'
ionic state restore > /dev/null
echo 'Ionic Add iOS'
ionic platform add ios > /dev/null
echo 'Ionic Add Android'
ionic platform add android > /dev/null
echo 'Install all dependencies'
npm install > /dev/null
echo 'Install libraries from bower.json'
bower install > /dev/null
echo 'Create build files with Gulp'
npm rebuild node-sass > /dev/null
gulp > /dev/null
popd