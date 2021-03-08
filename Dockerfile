FROM debian:buster

RUN apt update -y
RUN apt-get -y install wget curl
RUN apt-get -y install nginx \
						openssl \
						php7.3 \
						php7.3-fpm \
						php7.3-mysql \
						php-common \
						php7.3-cli \
						php7.3-common \
						php7.3-json \
						php7.3-opcache \
						php7.3-readline \
						mariadb-server \
						mariadb-client \
						php-json \
						php-mbstring

COPY srcs/launch.sh ./
COPY srcs/default ./
COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./

#.SH
CMD bash launch.sh

# Ouverture du port 80 (default) et du port 443 pour le SSL : HTTPS
EXPOSE 80
EXPOSE 443
