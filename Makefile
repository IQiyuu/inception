COMPOSE = docker-compose -f srcs/docker-compose.yml
DATA_FOLD = /home/dgoubin/data
WP_FOLD = ${DATA}/wordpress
DB_FOLD = ${DATA}/mariadb

all: up

up: build
	${COMPOSE} up -d

build:
	if [ ! -f "${DATA_FOLD}" ]; then \
		mkdir ${DATA_FOLD}; \
		if [ ! -d "${WP_FOLD}" ]; then \
			mkdir ${WP_FOLD}; \
		fi \
		if [ ! -d "${DB_FOLD}" ]; then \
			mkdir ${DB_FOLD}; \
		fi \
	fi
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
	rm -rf ${WP_FOLD}/wordpress/*
	rm -rf ${DB_FOLD}/mariadb/*

re: clean all