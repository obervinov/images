FROM quay.io/jupyterhub/k8s-singleuser-sample:4.1.0

ARG IMAGE_VERSION=1.0.2

LABEL org.opencontainers.image.description "This image contains utilities for automating work with JupiterHub"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/jupyterhub
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/jupyterhub/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on

USER root
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        mc \
        vim \
        software-properties-common \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libffi-dev \
        liblzma-dev \
        libgl1-mesa-dev \
        libglib2.0-0 \
        && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /.git-credentials-cache && chmod 600 /.git-credentials-cache
RUN git config --global credential.helper 'cache --timeout=3600000'

USER jovyan
ENV VENV_PATH=/home/jovyan/.venv
ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/jovyan/.local/bin:$VENV_PATH/bin
ENV PYTHONPATH=/home/jovyan:/home/jovyan/.venv/lib/python3.12/site-packages
RUN pip3 install --upgrade jupyterlab jupyterlab-git
