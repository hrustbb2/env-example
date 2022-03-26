#!/usr/bin/env bash

apk update && apk upgrade
apk add supervisor
apk add jpeg-dev
apk add libjpeg

apk add php8 \
php8-fpm \
php8-common \
php8-cli \
php8-gd \
php8-pdo_mysql \
php8-mbstring \
php8-curl \
php8-xml \
php8-zip \
php8-json \
php8-xdebug \
php8-tokenizer \
php8-fileinfo \
php8-dom \
php8-xmlwriter \
php8-session \
php8-mysqli \
php8-pecl-imagick \
php8-simplexml \
php8-sqlite3 \
composer

sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php8/php-fpm.d/www.conf

sed -i 's/post_max_size = 8M/post_max_size = 85M/g' /etc/php8/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10M/g' /etc/php8/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php8/php.ini

XDEBUG_CONF="/etc/php8/conf.d/xdebug.ini"
echo 'zend_extension=xdebug.so' >> $XDEBUG_CONF
echo 'xdebug.start_with_request=yes' >> $XDEBUG_CONF
echo 'xdebug.discover_client_host=true' >> $XDEBUG_CONF
echo 'xdebug.remote_cookie_expire_time = 3600' >> $XDEBUG_CONF
echo 'xdebug.client_host=192.168.0.1' >> $XDEBUG_CONF
echo 'xdebug.client_port = 9000' >> $XDEBUG_CONF
echo 'xdebug.remote_handler = dbgp' >> $XDEBUG_CONF
echo 'xdebug.idekey=PHPSTORM' >> $XDEBUG_CONF
echo 'xdebug.mode = debug' >> $XDEBUG_CONF
