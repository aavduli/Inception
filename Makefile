NAME=inception
SRC_DIR=srcs
VOLUME_WORDPRESS=$(SRC_DIR)/data/wordpress
VOLUME_MARIADB=$(SRC_DIR)/data/mariadb

.PHONY = all up down clean fclean re volumes

all: volumes
	docker-compose -f $(SRC_DIR)/docker-compose.yml up --build -d

up:
	docker-compose -f $(SRC_DIR)/docker_compose.yml up -d
down:
	docker-compose -f $(SRC_DIR)/docker_compose.yml down
clean : down
	docker volume rm $(NAME)_wordpress || true
	docker volume rm $(NAME)_mariadb || true

fclean: clean
	rm -rf $(VOLUME_WORDPRESS)
	rm -rf $(VOLUME_MARIADB)

volumes:
	mkdir -p $(VOLUME_WORDPRESS)
	mkdir -p $(VOLUME_MARIADB)

re: fclean all
