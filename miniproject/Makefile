default: up

prepare: preparescript.sh
	bash preparescript.sh

up:
	docker-compose up

down:
	docker-compose down

teardown:
	docker-compose down
	sudo rm -rf ./docker/*
