#!/bin/sh

# Generate Diffie-Hellman parameters (this may take some time)
openssl dhparam -out /etc/letsencrypt/ssl-dhparams.pem 2048

# Run Nginx in the background
nginx -g 'daemon off;' &
# Wait for Nginx to start
sleep 1

# Run Certbot once to get the initial certificate
certbot certonly --webroot -w /var/www/certbot -d ${CERTBOT_DOMAIN} --agree-tos --email ${CERTBOT_EMAIL}

# Renew the certificate every 12 hours (or as specified in the docker-compose.yml file)
trap exit TERM
while :
do
  certbot renew
  sleep 12h & wait $!
done
