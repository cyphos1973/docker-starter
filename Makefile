include .env

DOCKER_APP        = docker-compose exec php

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
	#$(DOCKER_COMPOSE) pull
	$(DOCKER_COMPOSE) up -d
	docker exec -it $(CONTAINER_NAME)_php bash

stop-remove-all:
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
	docker rmi $$(docker images -a -q) -f
	docker system prune -f

vendor:
	$(DOCKER_APP) composer install

node_modules:
	$(DOCKER_APP) yarn install

db-test: .env
	$(DOCKER_APP) bin/console doctrine:database:drop --if-exists --force
	$(DOCKER_APP) bin/console doctrine:database:create --if-not-exists
	$(DOCKER_APP) bin/console doctrine:schema:drop --force --no-interaction
	$(DOCKER_APP) bin/console doctrine:schema:create --no-interaction
	$(DOCKER_APP) bin/console doctrine:fixtures:load --no-interaction --purge-with-truncate -vvv

phpcs:
	$(DOCKER_APP) php vendor/bin/php-cs-fixer fix src/