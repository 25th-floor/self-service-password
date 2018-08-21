FROM 25thfloor/php-nginx:7.1
MAINTAINER 25th-floor GmbH <devops@25th-floor.com>

RUN apt-get update \
	&& apt-get -y install \
		php7.1-ldap \
		php7.1-mbstring

COPY LICENCE /var/www/
COPY *.php /var/www/
COPY conf/ /var/www/conf
COPY css/ /var/www/css
COPY fonts/ /var/www/fonts
COPY images/ /var/www/images
COPY js/ /var/www/js
COPY lang/ /var/www/lang
COPY lib/ /var/www/lib
COPY pages/ /var/www/pages

# nginx related
COPY docker/nginx.conf /etc/nginx/nginx.conf
