#!/bin/bash

source "/vagrant/provision/functions.sh"

echo 'Provision Moodle'

wwwdir=/git/moodle
dbname=moodle
datadir=/data/moodle
password=moodle

create_mysql_db $dbname


mkdir_777 /data
mkdir_777 $datadir

sudo cp $wwwdir/config-dist.php $wwwdir/config.php

sed -i -e s/\'password\'/\'$password\'/ -e s%example.com%moodle% $wwwdir/config.php

sed -i -e s/\'pgsql\'/\'mysqli\'/ -e s/\'username\'/\'root\'/ -e s%/home/example/moodledata%$datadir% $wwwdir/config.php

php $wwwdir/admin/cli/install_database.php --agree-license --lang=en --adminpass=$password
