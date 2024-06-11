#!/bin/sh
sleep 10
wp config create --allow-root\
	--dbname=$SQL_DATABASE\
	--dbuser=$SQL_USER\
	--dbpass=$SQL_PASSWORD\
	--dbhost=mariadb:3306\
	--path='/var/www/wordpress'
wp core install --url=$DOMAIN_NAME\
	--title=$WP_TITLE\
	--admin_user=$WP_ADMIN_USER\
	--admin_password=$WP_ADMIN_PASSWORD\
	--admin_email=$WP_ADMIN_MAIL\
	--locale=$WP_LOCALE\
	--skip-email
wp user create $WP_USER $WP_USER_MAIL\
	--role=editor\
	--user_pass=$WP_USER_PASSWORD\
	--send-email
