FROM		debian:bullseye
RUN		apt update -y
RUN		apt upgrade -y

# wordpress & php set up
RUN		apt-get install wget -y
RUN		apt-get install php7.4 php-fpm php-mysql mariadb-client -y
COPY		conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# wordpress config by wp-cli 
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
COPY		conf/wp-auto-config.sh ./wp-auto-config.sh
RUN		mkdir -p /var/www/wordpress
ENTRYPOINT	["bash", "wp-auto-config.sh"]

