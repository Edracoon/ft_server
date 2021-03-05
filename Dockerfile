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
						mariadb-client

COPY srcs/launch.sh ./
COPY srcs/default ./
COPY srcs/index.php ./

# NGINX CONFIG
CMD bash launch.sh

EXPOSE 80
