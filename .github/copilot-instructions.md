# GitHub Copilot Instructions

## Code Style Guidelines

1. **No Emojis**: Do not use emojis in code, comments, or log messages. Use clear, descriptive text instead.

2. **Documentation First**: Always consult official documentation in the web before making suggestions. Do not guess or hallucinate API methods, constants, or configuration options. When in doubt, refer to the official docs or ask for clarification.

3. **Simple Code**: Prefer writing simple, easy-to-read code over unnecessarily complicated solutions. Favor:
   - Clear variable names
   - Straightforward logic flow
   - Minimal nesting
   - Explicit over implicit
   - Readable over "clever"

4. **Dockerfile Guidelines**: 
   - Avoid comments in Dockerfile
   - Keep Dockerfile instructions simple and readable
   - Prefer straightforward RUN commands over mount optimizations

## Project-Specific Notes

- This is a Python MCP server project using FastMCP
- Always verify API methods, types, and configurations against the official FastMCP and Model Context Protocol (MCP) documentation
- Use standard logging practices without decorative elements
- Write code that is self-documenting and easy to maintain
