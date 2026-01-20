# Simple MCP server deployed on AWS Fargate
Very basic proof of concept project to showcase MCP server deployed on AWS Fargate.

# Local environment
The simplest way to run the MCP server locally is to use docker:
```bash
make up
```
The server will be available at `http://localhost:8000/sse`

## Testing Your Server Locally

### Option 1: MCP Inspector Web UI (Easiest)

Start the Inspector:
```bash
make inspector
```

This will automatically open your browser with the Inspector UI.

Then connect to your server:
- Select **"SSE"** transport
- Enter URL: `http://mcp-server:8000/sse`
- Set Connection Type as `Via Proxy`
- Click Connect

### Option 2: Quick Inspect (CLI)

See what tools, resources, and prompts are available:
```bash
docker compose exec mcp-server fastmcp inspect service/app.py:mcp
```

Get full JSON details:
```bash
docker compose exec mcp-server fastmcp inspect service/app.py:mcp --format fastmcp
```
