include .env

build:
	$(DOCKER_COMPOSE) build

pull:
	$(DOCKER_COMPOSE) pull

start:
	$(DOCKER_COMPOSE) up -d --remove-orphans

stop:
	$(DOCKER_COMPOSE) stop

stop-all:
	 docker stop $$(docker ps -a -q)

exec:
	docker exec -it $(CONTAINER_NAME)_php bash

down:
	$(DOCKER_COMPOSE) down

prune:
	docker system prune

install:
	$(DOCKER_COMPOSE) build --build-arg PHP_VERSION=$(PHP_VERSION)
	$(DOCKER_COMPOSE) pull
	$(DOCKER_COMPOSE) up -d
	docker exec -it $(CONTAINER_NAME)_php bash

stop-remove-all:
	sudo docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
	docker rmi $$(docker images -a -q) -f
	docker system prune -f

