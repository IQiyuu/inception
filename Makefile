COMPOSE = docker-compose -f srcs/docker-compose.yml
DATA = /home/dgoubin/data

all: up

up: build
	${COMPOSE} up -d

build:
	${COMPOSE} build

stop:
	${COMPOSE} stop

start:
	${COMPOSE} start

clean:
	${COMPOSE} down

fclean: clean
	rm -rf ${DATA}/wordpress/*
	rm -rf ${DATA}/mariadb/*

re: fclean all