FROM mcr.microsoft.com/devcontainers/ruby:3
RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential libpq-dev postgresql-client \
  && rm -rf /var/lib/apt/lists/*
