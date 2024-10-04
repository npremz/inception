#!/bin/bash

if [ ! -d /var/lib/mysql/${SQL_DATABASE} ]; then
	# Start MySQL and wait for it to be ready
	/usr/bin/mysqld_safe --datadir=/var/lib/mysql &
	while ! mysqladmin ping 2> /dev/null; do
    		sleep 1
	done

	echo "MYSQL started"

	# Create and populate the SQL file
	mysql -u root << EOF

	CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
	CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
	GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';
	FLUSH PRIVILEGES;

EOF
	echo "Database and user created"
	killall mysqld 2> /dev/null
fi

service mysql start
tail -f /dev/null
