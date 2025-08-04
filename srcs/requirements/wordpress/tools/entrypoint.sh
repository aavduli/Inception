# Use consistent path
WP_PATH="/var/www/html"

# Wait for DB
until mysqladmin ping -h"$MARIADB_HOST" -u"$MARIADB_USER" -p"$MARIADB_PASSWORD" --silent; do
	sleep 1
done

if [ ! -f "$WP_PATH/wp-config.php" ]; then
  echo "Downloading WordPress..."
  wp core download --path="$WP_PATH" --allow-root

  echo "Creating wp-config.php..."
  wp config create \
    --dbname="$MARIADB_DATABASE" \
    --dbuser="$MARIADB_USER" \
    --dbpass="$MARIADB_PASSWORD" \
    --dbhost="$MARIADB_HOST" \
    --path="$WP_PATH" \
    --allow-root \
    --skip-check
fi

chmod -R 755 "$WP_PATH/wp-content" || echo "wp-content not found, skipping chmod"

if ! wp core is-installed --path="$WP_PATH" --allow-root; then
  wp core install \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN" \
    --admin_password="$WP_ADMIN_PWD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --path="$WP_PATH" \
    --allow-root
fi

exec php-fpm8.2 -F
