FROM python:3.12-alpine as builder

ENV PATH="${VIRTUAL_ENV}/bin:$PATH" \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=0 \
    VIRTUAL_ENV=/opt/venv

COPY --from=ghcr.io/astral-sh/uv:0.6.9 /uv /uvx /bin/

WORKDIR /app

COPY ./pyproject.toml .

RUN uv venv ${VIRTUAL_ENV} && \
    uv pip compile --all-extras pyproject.toml --output-file=requirements.txt && \
    uv pip install -r requirements.txt && \
    find /opt/venv -type d -name "__pycache__" -exec rm -rf {} + && \
    find /opt/venv -type f -name "*.pyc" -delete && \
    find /opt/venv -type f -name "*.pyo" -delete && \
    find /opt/venv -type f -name "*.opt-1.pyc" -delete

COPY . ./app/

FROM python:3.12-alpine as final

RUN addgroup -S app && adduser -S app -G app

ARG PORT=8000 \
    HOST=0.0.0.0

ENV PORT=$PORT \
    HOST=$HOST \
    PATH="/opt/venv/bin:$PATH"

COPY --from=builder --chown=app:app /opt/venv /opt/venv
COPY --from=builder --chown=app:app /app /app

USER app
WORKDIR /app
EXPOSE $PORT
