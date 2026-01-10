# Simple MCP server deployed on AWS Lambda
Very basic mvp project to showcase MCP server deployed on AWS Lambda.
Based on [Ran Isenberg's MCP Blueprint](https://github.com/ran-isenberg/aws-lambda-mcp-cookbook)

# Local environment
The simplest way to run the MCP server locally is to use docker:
```bash
make up
```
The server will be available at `http://localhost:8000`

# Testing the server

```bash
# List available tools
curl -X POST http://localhost:8000/mcp/v1 \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","method":"tools/list","id":1}'

# Call the math tool
curl -X POST http://localhost:8000/mcp/v1 \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","method":"tools/call","params":{"name":"math","arguments":{"a":5,"b":3}},"id":2}'
```