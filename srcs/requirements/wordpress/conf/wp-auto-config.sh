#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then

	mkdir -p /run/php 
	cd /var/www/wordpress
	wp core download --allow-root
	
	until mysqladmin --user=${SQL_USER} --password=${SQL_PASSWORD} --host=mariadb ping; do
		sleep 2
	done

	wp config create --allow-root\
		--dbname=$SQL_DATABASE\
		--dbuser=$SQL_USER\
		--dbpass=$SQL_PASSWORD\
		--dbhost=mariadb:3306
	wp core install --url=$DOMAIN_NAME\
		--allow-root\
		--title=$WP_TITLE\
		--admin_user=$WP_ADMIN_USER\
		--admin_password=$WP_ADMIN_PASSWORD\
		--admin_email=$WP_ADMIN_MAIL\
		--locale=$WP_LOCALE\
		--skip-email
	wp user create $WP_USER $WP_USER_MAIL\
		--allow-root\
		--role=editor\
		--user_pass=$WP_USER_PASSWORD
fi

php-fpm7.4 -F
