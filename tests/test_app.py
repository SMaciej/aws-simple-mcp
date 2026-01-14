import pytest
from fastmcp import Client

from service.app import mcp


@pytest.mark.asyncio
async def test_hello_default():
    async with Client(mcp) as client:
        result = await client.call_tool("hello", {})
        assert result.content[0].text == "Hello, World!"


@pytest.mark.asyncio
async def test_hello_with_name():
    async with Client(mcp) as client:
        result = await client.call_tool("hello", {"name": "Alice"})
        assert result.content[0].text == "Hello, Alice!"
