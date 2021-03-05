# NginX
rm /etc/nginx/sites-available/default
mv /default /etc/nginx/sites-available

#SSL
mkdir etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Nice/L=Nice/O=42 School/OU=Edgar/CN=localhost"

#PHP

#Launch
service nginx start
service php7.3-fpm start
service mysql start
sleep infinity
