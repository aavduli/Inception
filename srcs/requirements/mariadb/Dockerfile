# DOCKERFILE
FROM mariadb:11.1

# Set environment variables (these get overriden by docker-compose)
ENV MARIADB_ROOT_PASSWORD=root_password

# Copy the init SQL script
COPY ./conf/init.sql /docker-entrypoint-initdb.d/
