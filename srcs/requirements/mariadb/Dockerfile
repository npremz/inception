FROM debian:buster
RUN apt update --allow-releaseinfo-change -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/maria.conf.d/50-server.cnf
COPY tools/init-db.sh ./init-db.sh
ENTRYPOINT ["bash", "init-db.sh"]

