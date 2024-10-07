FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN mysql_install_db \
	--user=mysql \
	--datadir=/var/lib/mysql \
	--auth-root-authentication-method=normal \
	--skip-test-db

RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
