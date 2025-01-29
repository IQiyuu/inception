# FROM debian:buster

# RUN apt update -y

# RUN apt-get install wget -y

# RUN apt-get install -y php7.3\
# 					   php-fpm\
# 					   php-mysql\
# 					   mariadb-client

# RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# RUN wget https://fr.wordpress.org/wordpress-6.7.1-fr_FR.tar.gz -P /var/www

# RUN cd /var/www && tar -xzf wordpress-6.7.1-fr_FR.tar.gz && rm wordpress-6.7.1-fr_FR.tar.gz

# #RUN chown -R root:root /var/www/wordpress

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# COPY ./conf/ /var/www/
# COPY ./tools/config.sh /var/www/config.sh

# CMD ["bash", "/var/www/config.sh"]

FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/config.sh

ENTRYPOINT [ "/var/www/config.sh" ]