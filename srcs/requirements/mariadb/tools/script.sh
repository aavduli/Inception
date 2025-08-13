#!/bin/bash

set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -f "/var/lib/mysql/.db-init-complete" ]; then
    echo "[INFO] Initializing MariaDB database..."

    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql > /dev/null

    mysqld --skip-networking &
    sleep 5

    echo "[INFO] Setting root password and creating DB/user..."
    mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

    mysqladmin -uroot -p"${MYSQL_ROOT_PASSWORD}" shutdown

    echo "[INFO] MariaDB initialization complete!"
    touch /var/lib/mysql/.db-init-complete
else
    echo "[INFO] MariaDB already initialized — skipping init."
fi

exec mysqld
