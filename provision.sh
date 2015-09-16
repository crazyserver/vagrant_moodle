#!/bin/bash

source "/vagrant/provision/functions.sh"

/vagrant/provision/base.sh
/vagrant/provision/php5.sh
/vagrant/provision/mysql.sh $pass
#/vagrant/provision/oracle-extended.sh agora
#/vagrant/provision/moodlemobile.sh

mkdir_777 /data
mkdir_777 /data/moodle

sudo service apache2 restart
#sudo service oracle-xe restart

#Here we must write the latest version number
save_version 2015061000
