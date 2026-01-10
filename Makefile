build:
	docker compose build

up:
	docker compose up

test:
	docker compose run --rm test

lint-check:
	docker compose run --rm lint-check