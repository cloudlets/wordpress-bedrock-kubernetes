FROM composer:1.9.0 as builder

WORKDIR /build

COPY composer.json .
COPY composer.lock .

RUN composer install

FROM php:7.3-apache
ENV APACHE_DOCUMENT_ROOT=/var/www/html/web

# install the PHP extensions we need
RUN set -ex; \
	\
	apt-get update; \
	apt-get install -y \
		libjpeg-dev \
		libpng-dev \
	; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli opcache

# TODO consider removing the *-dev deps and only keeping the necessary lib* packages

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN a2enmod rewrite expires

VOLUME /var/www/html

COPY --from=builder /build /var/www/html
COPY . /var/www/html
COPY apache/000-default.conf /etc/apache2/sites-available/
COPY ./start.sh /
RUN chmod a+x /start.sh

ENTRYPOINT ["/start.sh"] 
CMD ["/bin/bash", "-c", "apache2-foreground"]
