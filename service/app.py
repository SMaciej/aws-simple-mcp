from fastmcp import FastMCP

mcp = FastMCP("Simple MCP server")


@mcp.tool()
def hello(name: str = "World") -> str:
    """Returns a hello message"""
    return f"Hello, {name}!"
