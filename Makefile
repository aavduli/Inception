NAME=inception
SRC_DIR=srcs

.PHONY: all up down clean fclean re

all: up

up:
	docker-compose -f $(SRC_DIR)/docker-compose.yml up --build -d

down:
	docker-compose -f $(SRC_DIR)/docker-compose.yml down

clean: down
	sudo rm -rf /home/aavduli/data/

fclean: clean
	docker system prune -af --volumes

re: fclean all
