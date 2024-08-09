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
	docker compose exec web bash
db:
	docker compose exec db bash
log:
	docker compose logs

# Mac Docker Permission
mac_docker:
	export DOCKER_BUILDKIT=0

