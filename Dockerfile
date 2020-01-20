FROM composer:1.9.0 as builder

WORKDIR /build

COPY composer.json .
COPY composer.lock .

RUN composer install

FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libicu-dev \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libxslt1-dev \
    libfreetype6-dev \
    nginx && \
    docker-php-ext-configure gd --with-jpeg-dir=/usr/local/share/ --with-freetype-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) bcmath mysqli gd curl intl mbstring pdo pdo_mysql soap xsl zip opcache

RUN usermod -u 1000 www-data

COPY ./default.conf /etc/nginx/sites-available/default
RUN sed -i 's/php-fpm/127.0.0.1/g' /etc/nginx/sites-available/default

COPY --from=builder /build /var/www/html
COPY . /var/www/html
ENTRYPOINT ["/start.sh"] 
CMD ["/bin/bash", "-c", "nginx -g 'daemon off;' & /usr/local/sbin/php-fpm"]
