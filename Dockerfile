FROM debian:buster

RUN apt update -y
RUN apt-get -y install wget curl
RUN apt-get -y install nginx \
						openssl \
						php \
						php-fpm \
						php-mysql \
						php-common \
						php-cli \
						php-json \
						php-opcache \
						php-readline \
						mariadb-server \
						mariadb-client \
						php-mbstring \
						php-zip \
						php-gd \
						php-curl \
						php-intl \
						php-soap \
						php-xml \
						php-xmlrpc

COPY srcs/launch.sh ./
COPY srcs/default ./
COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./

#.SH
CMD bash launch.sh

# Ouverture du port 80 (default) et du port 443 pour le SSL : HTTPS
EXPOSE 80
EXPOSE 443
