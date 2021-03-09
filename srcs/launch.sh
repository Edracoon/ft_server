# Nginx
mkdir var/www/localhost
rm /etc/nginx/sites-available/default
mv ./default /etc/nginx/sites-available
# creation du lien symbolique entre le default de avaible et celui de enabled pour rentre la config enabled aux yeux de nginx
ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled
# attribution des droits sinon nginx aura pas acces a tout ce qu'il a besoin pour wordpress et phpmyadmin
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# SSL
	mkdir etc/nginx/ssl
	#creation de la clé ssl pour le https
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Nice/L=Nice/O=42 School/OU=epfennig/CN=localhost"

# MySQL
	service mysql start
	# creation de la base de donnée wordpress avec mysql
	echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
	# on donne les droits à wordpress pour acceder à la base de donnée mysql
	echo "GRANT ALL ON wordpress.* TO 'epfennig'@'localhost' IDENTIFIED BY 'mdp';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

# Partie de configuration et d'installation de PhpMyAdmin
	# installation de phpmyadmin
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz

	# extraction de phpmyadmin avec tar
	tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz

	# mettre phpMyAdmin la ou on veut ( notre www/serv )
	mkdir var/www/localhost/phpmyadmin
	mv phpMyAdmin-4.9.0.1-all-languages/* /var/www/localhost/phpmyadmin
	rm -rf phpMyAdmin-4.9.7-all-languages.tar.gz

	# moove de la config phpmyadmin modifiée
	mv ./config.inc.php var/www/localhost/phpmyadmin

	# donne les droits et acces ( pas obligatoire mais fortement conseillé )
	chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
	chown -R www-data:www-data /var/www/localhost/phpmyadmin

	# config mysql pour phpmyadmin
	# on echo dans le shell mysql car on peut pas faire les commandes en direct dans le terminal
	echo "GRANT ALL PRIVILEGES ON *.* TO 'epfennig'@'localhost' IDENTIFIED BY 'mdp'" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

# Partie de configuration et d'installation de WordPress et sa base de donnée
	# installation de wordpress
	wget https://wordpress.org/latest.tar.gz
	tar xvf latest.tar.gz
	# creation du dossier wordpress
	mv ./wordpress /var/www/localhost/
	mv ./wp-config.php /var/www/localhost/wordpress
	rm latest.tar.gz

# Launch
service nginx start
service php7.3-fpm start
service mysql restart
sleep infinity
