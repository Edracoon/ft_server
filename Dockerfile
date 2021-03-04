FROM debian:buster

RUN apt update -y
RUN apt-get -y install wget curl
RUN apt-get -y install vim \
						nginx \
						openssl

COPY srcs/launch.sh ./

# NGINX CONFIG
CMD bash /launch.sh

EXPOSE 80
