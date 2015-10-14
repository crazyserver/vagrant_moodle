#!/bin/bash

source "/vagrant/provision/functions.sh"

echo 'Provision Moodle'

database=$1
wwwdir=/git/moodle
dbname=moodle
datadir=/data/moodle
password=moodle

mkdir_777 /data
mkdir_777 $datadir

sudo cp $wwwdir/config-dist.php $wwwdir/config.php

#Repace password
sed -i -e s/\'password\'/\'$password\'/ $wwwdir/config.php
#Replace wwwroot
sed -i -e s%example.com%moodle% $wwwdir/config.php
#Replace Moodledata
sed -i -e s%/home/example/moodledata%$datadir% $wwwdir/config.php

case "$database" in
    mysql)
        create_mysql_db $dbname
        #Replace db engine
        sed -i -e s/\'pgsql\'/\'mysqli\'/ $wwwdir/config.php
        #Replace username
        sed -i -e s/\'username\'/\'root\'/ $wwwdir/config.php
        ;;
    oracle)
        create_oracle_db moodle
        execute_in_oracle "@$wwwdir/lib/dml/oci_native_moodle_package.sql"
        execute_in_oracle "@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/catexp.sql"
        #Replace db engine
        sed -i -e s/\'pgsql\'/\'oci\'/ $wwwdir/config.php
        #Replace the prefix
        sed -i '/prefix/s/mdl_/m2/' $wwwdir/config.php
        #Replace the dbname
        sed -i '/dbname/s/moodle/XE/' $wwwdir/config.php
        #Replace the hostname
        sed -i '/dbhost/s/localhost//' $wwwdir/config.php
        #Change persist
        sed -i '/dbpersist/s/false/true/' $wwwdir/config.php
        #Replace username
        sed -i -e s/\'username\'/\'moodle\'/ $wwwdir/config.php

        source "/vagrant/provision/oracle/oracle-env.sh"
        ;;
    *)
        #Replace username
        sed -i -e s/\'username\'/\'root\'/ $wwwdir/config.php
        create_pgsql_db $dbname root
        ;;
esac

php $wwwdir/admin/cli/install_database.php --agree-license --lang=en --adminpass=$password
