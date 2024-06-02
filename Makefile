# for Windows
UNAME=$(shell uname)
PREFIX=winpty
ifeq (${UNAME}, Darwin)
	PREFIX=
endif

up:
	docker compose up -d
build:
	docker compose build --no-cache --force-rm
down:
	docker compose down
web:
	${PREFIX} docker compose exec web bash
db:
	${PREFIX} docker compose exec db bash

# Mac Docker Permission
mac_docker:
	export DOCKER_BUILDKIT=0

