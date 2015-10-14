#!/bin/bash

echo "Remounting all synced filesystem..."
cd /
sudo mount -o remount git_moodle
sudo mount -o remount vagrant
echo "Done"