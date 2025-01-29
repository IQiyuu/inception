#!/bin/sh

# sleep 10

# cd /var/www/wordpress

# if [ ! -f wp-config.php ];
# then
# 	wp core download --allow-root;
# 	echo "Wordpress: creating users..."
#     wp config create	--allow-root \
# 					--dbname=$MYSQL_DB \
# 					--dbuser=$MYSQL_USER \
# 					--dbpass=$MYSQL_PASSWORD \
# 					--dbhost=mariadb:3306 --path='/var/www/wordpress'
# 	wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
# 	wp user create --allow-root ${WP_USER} ${WP_USER_MAIL} --user_pass=${WP_USER_PASSWORD};
# 	echo "Wordpress: set up!"
# fi

# /usr/sbin/php-fpm7.3 -F
# echo "wordpress end"

sleep 10

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	wp core install --allow-root --url=${localhost} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_MAIL}
	wp user create --allow-root ${WP_USER} ${WP_USER_MAIL} --user_pass=${WP_USER_PASSWORD};
fi

echo "Wordpress end"
/usr/sbin/php-fpm7.3 -F