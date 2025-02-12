COMPOSE = docker-compose -f srcs/docker-compose.yml
DATA = /home/dgoubin/data

all: up

up: build
	${COMPOSE} up -d

build:
	${COMPOSE} build

restart:
	${COMPOSE} restart

logs:
	${COMPOSE} logs

stop:
	${COMPOSE} stop

start:
	${COMPOSE} start

down:
	${COMPOSE} down

clean: down
	docker system prune -af
	rm -rf ${DATA}/wordpress/*
	rm -rf ${DATA}/mariadb/*

re: clean all