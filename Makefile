build:
	docker compose build

up:
	docker compose up

inspector:
	@docker compose up -d inspector
	@sleep 2
	@TOKEN=$$(docker compose logs inspector | grep "MCP_PROXY_AUTH_TOKEN=" | tail -1 | sed 's/.*MCP_PROXY_AUTH_TOKEN=//'); \
	xdg-open "http://localhost:6274/?MCP_PROXY_AUTH_TOKEN=$$TOKEN&transport=sse&serverUrl=http://mcp-server:8000/sse"

test:
	docker compose run --rm test

lint-check:
	docker compose run --rm lint-check