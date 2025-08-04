#!/bin/bash


set -e

# Create run directory for MariaDB socket
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Initialize database if not already present
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB..."
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql > /dev/null
fi

# Start MariaDB temporarily in background to run setup SQL
mysqld_safe --skip-networking &
sleep 5  # wait for mysqld to be ready

# Run SQL setup
mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# Shutdown temporary server
mysqladmin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown

# Start MariaDB in foreground
exec mysqld_safe
