FROM python:3.10-slim as base

# Metadata as defined above
LABEL maintainer="Yogesh AMbhore <yogeshambhore45@gmail.com>" \
      version="1.0" \
      description="Django Deployment Example"

# Set environment variables
ENV PYTHONFAULTHANDLER 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONHASHSEED random
ENV PIP_NO_CACHE_DIR 1
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PIP_DEFAULT_TIMEOUT 100
ENV PYTHONIOENCODING utf-8

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
    apt-utils jq libffi-dev libssl-dev ca-certificates \
    bash build-essential curl gettext git libpq-dev libmagic-dev wget && \
    # Clear caches:
    apt autoremove -y && apt clean -y && rm -rf /var/lib/apt/lists && rm -rf /var/cache/apt

WORKDIR /code

COPY poetry.lock pyproject.toml ./
ENV POETRY_VERSION 1.7.1
ENV POETRY_VIRTUALENVS_CREATE false
ENV POETRY_HOME=/etc/poetry
RUN python3 -m pip install --no-cache-dir --upgrade pip
RUN curl -sSL https://install.python-poetry.org | python3 -

ADD . ./

RUN PATH="${POETRY_HOME}/bin:${PATH}" && \
    poetry install --no-root --no-interaction --no-ansi --only main && \
    poetry cache clear --no-interaction --all pypi


CMD ["/etc/poetry/bin/poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]
