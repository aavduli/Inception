#!/bin/bash

# Replace placeholders in the default site config
sed -i "s|my_cert|$SSL_CERTIFICATE|g" /etc/nginx/sites-available/default
sed -i "s|my_key|$SSL_CERTIFICATE_KEY|g" /etc/nginx/sites-available/default
sed -i "s|DOMAIN_NAME|$NGINX_DOMAIN|g" /etc/nginx/sites-available/default

# Start nginx in foreground
exec nginx -g "daemon off;"
