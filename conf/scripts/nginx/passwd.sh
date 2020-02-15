#!/usr/bin/env bash

user=$1

echo ${user}
echo -n ${user}':' >> /home/passwd/.htpasswd
openssl passwd -apr1 >> /home/passwd/.htpasswd