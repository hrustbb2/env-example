#!/usr/bin/env bash

docker-php-ext-install pdo pdo_mysql
docker-php-ext-enable pdo pdo_mysql

apk add autoconf \
gcc \
g++ \
make

cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

pecl install xdebug

XDEBUG_CONF="/usr/local/etc/php/conf.d/xdebug.ini"
echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20190902/xdebug.so' >> $XDEBUG_CONF
echo 'xdebug.remote_enable=on' >> $XDEBUG_CONF
echo 'xdebug.remote_autostart=on' >> $XDEBUG_CONF
echo 'xdebug.remote_connect_back=off' >> $XDEBUG_CONF
echo 'xdebug.remote_handler=dbgp' >> $XDEBUG_CONF
echo 'xdebug.profiler_enable=0' >> $XDEBUG_CONF
echo 'xdebug.profiler_output_dir="/home/xdebug"' >> $XDEBUG_CONF
echo 'xdebug.remote_port=9000' >> $XDEBUG_CONF
echo 'xdebug.remote_host=192.168.0.1' >> $XDEBUG_CONF