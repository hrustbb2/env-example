#!/usr/bin/env bash

cp /home/scripts/.env_dev /var/www/html/.env
cd /var/www/html
composer install
chmod -R 777 storage
php8 artisan key:generate
php8 artisan session:table
php8 artisan migrate