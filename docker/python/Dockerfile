FROM python:3.12.2

LABEL org.opencontainers.image.description "This image used for run python scripts and tools"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/python
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/python/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 1.0.0



RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    vim \
    mc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install requests

ENTRYPOINT ["tail", "-f", "/dev/null"]
