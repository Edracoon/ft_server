# NginX
mkdir var/www/epfennigserv
rm /etc/nginx/sites-available/default
mv ./default /etc/nginx/sites-available

#SSL
mkdir etc/nginx/ssl
# creation de la clé ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Nice/L=Nice/O=42 School/OU=epfennig/CN=epfennigserv"

# Partie de configuration et d'installation de PhpMyAdmin
	service mysql start
	# installation de phpmyadmin
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz

	# extraction de phpmyadmin avec tar
	tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz

	# mettre phpMyAdmin la ou on veut ( notre www/serv )
	mkdir var/www/epfennigserv/phpmyadmin
	mv phpMyAdmin-4.9.0.1-all-languages/* /var/www/epfennigserv/phpmyadmin
	rm -rf phpMyAdmin-4.9.7-all-languages.tar.gz

	# config phpmyadmin
	mv ./config.inc.php var/www/epfennigserv/phpmyadmin

	# donne les droits a phpmyadmin
	chmod 660 /var/www/epfennigserv/phpmyadmin/config.inc.php
	chown -R www-data:www-data /var/www/epfennigserv/phpmyadmin
	service php7.3-fpm start

	# config mysql pour phpmyadmin
	# on echo dans le shell mysql car on peut pas faire les commandes en direct dans le terminal
	echo "GRANT ALL PRIVILEGES ON *.* TO 'epfennig'@'epfennigserv' IDENTIFIED BY 'mdp'" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

# Partie de configuration et d'installation de WordPress et sa base de donnée
	# creation de la base de donnée
	echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
	# on donne les droits à wordpress pour acceder à la base de donnée mysql
	echo "GRANT ALL ON wordpress.* TO 'epfennig'@'epfennigserv' IDENTIFIED BY 'mdp';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root
	# installation de wordpress
	wget https://wordpress.org/latest.tar.gz
	tar xvf latest.tar.gz
	# creation du dossier wordpress
	mkdir var/www/epfennigserv/wordpress
	cp -a wordpress/. /var/www/epfennigserv/wordpress
	mv ./wp-config.php /var/www/epfennigserv/wordpress

# Launch
service php7.3-fpm restart
service nginx start
service mysql restart
sleep infinity
