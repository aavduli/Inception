FROM debian:12.11

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
        mariadb-client \
        php \
        php-fpm \
        php-mysql \
        php-zip \
        php-curl \
        php-redis \
        sendmail \
        curl \
        vim && \
    mkdir -p /run/php

# 🔧 Make PHP-FPM listen on TCP port 9000
RUN sed -i 's|^listen = .*|listen = 9000|' /etc/php/*/fpm/pool.d/www.conf

# Set working directory
WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Download WordPress
RUN wp core download --allow-root

# Copy entrypoint
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
