DOCKER_COMPOSE		= docker-compose
SYMFONY			= $(DOCKER_COMPOSE) exec -T php /usr/bin/entrypoint make --directory=app/
CONTAINER_NAME		= docker-test_php


build:
	$(DOCKER_COMPOSE) build

pull:
	$(DOCKER_COMPOSE) pull

start:
	$(DOCKER_COMPOSE) up -d --remove-orphans

stop:
	$(DOCKER_COMPOSE) stop

stop-all:
	 docker stop $$(sudo docker ps -a -q)

down:
	$(DOCKER_COMPOSE) down

prune:
	docker system prune

install:
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) pull
	$(DOCKER_COMPOSE) up -d
	docker exec -it $(CONTAINER_NAME) bash
