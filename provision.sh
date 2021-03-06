#!/bin/bash

source "/vagrant/provision/functions.sh"

database=$1

/vagrant/provision/base.sh
/vagrant/provision/php5.sh
case "$database" in
    mysql)
        /vagrant/provision/mysql.sh $pass
        ;;
    oracle)
        /vagrant/provision/oracle-extended.sh $pass
        ;;
    *)
        database="pgsql"
        /vagrant/provision/pgsql.sh $pass
        ;;
esac

/vagrant/provision/ionic.sh

sudo service apache2 restart

/vagrant/provision/moodle.sh $database

execute_as_vagrant "/vagrant/provision/moodlemobile.sh"

#Here we must write the latest version number
save_version 2015061000
