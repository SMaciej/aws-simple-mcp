FROM python:3.13-slim

WORKDIR /app

RUN pip install uv

COPY pyproject.toml ./

ENV UV_SYSTEM_PYTHON=1
ENV UV_COMPILE_BYTECODE=1
RUN --mount=type=cache,target=/root/.cache/uv \
    uv pip install --system -r pyproject.toml --extra dev

RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app

USER appuser

COPY --chown=appuser:appuser . .

EXPOSE 8000

CMD ["fastmcp", "run", "service.mcp_server:mcp", "--port", "8000", "--host", "0.0.0.0"]
