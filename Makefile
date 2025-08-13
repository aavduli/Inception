NAME=inception
SRC_DIR=srcs

.PHONY: all up down clean fclean re

all: up

up:
	docker-compose -f $(SRC_DIR)/docker-compose.yml up --build -d

down:
	docker-compose -f $(SRC_DIR)/docker-compose.yml down

clean: down
	docker volume rm wordpress_data || true
	docker volume rm mariadb_data || true

fclean: clean
	# no folders to remove anymore

re: fclean all
