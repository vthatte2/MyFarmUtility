#!/bin/sh
# Create self-signed SSL Certificate
# Author: [Josef Jezek](http://about.me/josefjezek)
# Donate: [Gittip](https://www.gittip.com/josefjezek)
# Link: [Gist](https://gist.github.com/6018928)
# Usage: create-self-signed-ssl.sh domain.cz

DOMAIN=$1
EMAIL=admin@$DOMAIN
COUNTRY=$(echo "$DOMAIN" | rev | cut -d'.' -f1 | rev)
DAYS=3650

sudo openssl genrsa -out /etc/ssl/private/$DOMAIN.key 1024
sudo echo -ne "$COUNTRY\n$COUNTRY\n\n$DOMAIN\n$DOMAIN\n$DOMAIN\n$EMAIL\n" | \
sudo openssl req -new -key /etc/ssl/private/$DOMAIN.key -x509 -out /etc/ssl/certs/$DOMAIN.crt -days $DAYS