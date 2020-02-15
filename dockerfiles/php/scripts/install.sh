#!/usr/bin/env bash

apk update && apk upgrade
apk add supervisor
apk add jpeg-dev
apk add libjpeg

apk add php7 \
php7-fpm \
php7-opcache \
php7-common \
php7-cli \
php7-gd \
php7-pdo_mysql \
php7-mbstring \
php7-curl \
php7-xml \
php7-zip \
php7-json \
php7-xdebug \
php7-tokenizer \
php7-fileinfo \
php7-dom \
php7-xmlwriter \
php7-session \
php7-mysqli \
php7-pecl-imagick \
php7-simplexml \
composer

sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php7/php-fpm.d/www.conf

sed -i 's/post_max_size = 8M/post_max_size = 85M/g' /etc/php7/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10M/g' /etc/php7/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php7/php.ini

XDEBUG_CONF="/etc/php7/conf.d/xdebug.ini"
echo 'zend_extension=xdebug.so' >> $XDEBUG_CONF
echo 'xdebug.remote_enable=on' >> $XDEBUG_CONF
echo 'xdebug.remote_autostart=on' >> $XDEBUG_CONF
echo 'xdebug.remote_connect_back=off' >> $XDEBUG_CONF
echo 'xdebug.remote_handler=dbgp' >> $XDEBUG_CONF
echo 'xdebug.profiler_enable=0' >> $XDEBUG_CONF
echo 'xdebug.profiler_output_dir="/home/xdebug"' >> $XDEBUG_CONF
echo 'xdebug.remote_port=9000' >> $XDEBUG_CONF
echo 'xdebug.remote_host=192.168.0.1' >> $XDEBUG_CONF
