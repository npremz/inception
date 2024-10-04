#!/bin/bash
set -e

until mysqladmin ping -h"localhost" --silent; do
    echo 'Waiting for MySQL to be ready...'
    sleep 1
done

mysqladmin -u root password "$SQL_ROOT_PASSWORD" || echo "Root password already set"

mysql -uroot -p"$SQL_ROOT_PASSWORD" <<EOSQL
CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO '$SQL_USER'@'%';
FLUSH PRIVILEGES;
EOSQL

echo "Database and user created."
