#!/usr/bin/env bash

apk update && apk upgrade
apk add nginx
apk add certbot
apk add supervisor
apk add openssl

mkdir -p /run/nginx
mkdir /etc/certbot
mkdir /var/www/letsencrypt

echo "rsa-key-size = 2048" > /etc/certbot/conf.ini
echo "text = True" >> /etc/certbot/conf.ini
echo "authenticator = webroot" >> /etc/certbot/conf.ini
echo "webroot-path = /var/www/letsencrypt" >> /etc/certbot/conf.ini