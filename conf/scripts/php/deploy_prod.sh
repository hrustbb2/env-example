#!/usr/bin/env bash

cp /home/scripts/.env_prod /var/www/html/.env
cd /var/www/html
composer install
chmod -R 777 storage
php artisan key:generate
php artisan session:table
php artisan migrate