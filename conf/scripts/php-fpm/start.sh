#!/usr/bin/env bash

# /usr/bin/supervisord -c /home/scripts/supervisord.conf
php-fpm -D
tail -f /dev/null