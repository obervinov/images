### VERSIONS METADATA ###
ARG IMAGE_VERSION=1.0.1
ARG PYTHON_VERSION=3.12.5
### END VERSIONS METADATA ###


FROM python:${PYTHON_VERSION}

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image used for run python scripts and tools"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/python
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/python/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
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
