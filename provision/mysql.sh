#!/bin/bash

source "/vagrant/provision/functions.sh"

pass=$1

echo 'Install MySQL'

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $pass"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $pass"

sudo apt-get install -y mysql-server-5.5 > /dev/null
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
sudo service mysql restart

sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $pass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $pass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $pass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get install -y phpmyadmin > /dev/null

sudo sed -i "s/.*\['auth_type'\].*/\$cfg['Servers'][\$i]['auth_type'] = 'config';\n\$cfg['Servers'][\$i]['user'] = 'root';\n\$cfg['Servers'][\$i]['password'] = '$pass';/" /etc/phpmyadmin/config.inc.php
sudo sed -i '/^.*open_basedir/ s/$/:\/tmp\//' /etc/apache2/conf-enabled/phpmyadmin.conf
