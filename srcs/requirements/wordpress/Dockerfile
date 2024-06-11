FROM		debian:buster
RUN		apt update -y
RUN		apt upgrade -y

# wordpress & php set up
RUN		apt-get install wget -y
RUN		apt-get install php7.3 php-fpm php-mysql mariadb-client -y
RUN		wget https://fr.wordpress.org/wordpress-6.5.4-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.5.4-fr_FR.tar.gz && rm wordpress-6.5.4-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress
COPY		conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.con

# wordpress config by wp-cli 
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
COPY		conf/wp-auto-config.sh ./wp-auto-config.sh
ENTRYPOINT	["bash", "wp-auto-config.sh"]

# check if folder /run/php exist, if not, creates it
RUN		mkdir /run/php	
RUN		chown -R www-data:www-data /run/php

# launch php-fpm
RUN		/usr/sbin/php-fpm7.3 -F 
