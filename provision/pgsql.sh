#!/bin/bash

source "/vagrant/provision/functions.sh"

pass=$1

echo 'Install PostgreSQL'

sudo apt-get install -y postgresql postgresql-contrib php5-pgsql > /dev/null

execute_in_pgsql "ALTER ROLE postgres WITH PASSWORD '$pass';"
execute_in_pgsql "CREATE USER root WITH PASSWORD '$pass' SUPERUSER;"

sudo apt-get install -y phppgadmin > /dev/null

sudo ln -s /etc/apache2/conf.d/phppgadmin /etc/apache2/conf-enabled/phppgadmin.conf
sudo sed -i '/allow from all/s/^#//g' /etc/apache2/conf.d/phppgadmin
sudo sed -i '/allow from 127/s/^/#/g' /etc/apache2/conf.d/phppgadmin

sudo sed -i -e s/peer/trust/ /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i 's/\(^.*conf\[.extra_login_security.\] =\) true/\1 false/' /etc/phppgadmin/config.inc.php


sudo service postgresql restart