#!/usr/bin/env bash

domain=$1

certbot certonly --config /etc/certbot/conf.ini -d ${domain}