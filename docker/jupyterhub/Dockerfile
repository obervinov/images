FROM quay.io/jupyterhub/k8s-singleuser-sample:4.1.0

ARG IMAGE_VERSION=1.0.0

LABEL org.opencontainers.image.description "This image contains utilities for automating work with gitlab"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/jupyterhub
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/jupyterhub/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV POETRY_NO_INTERACTION=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV VENV_PATH=/home/jupyterhub/app/.venv
ENV PATH=/home/jupyterhub/.local/bin:$VENV_PATH/bin:$PATH

USER root

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git curl software-properties-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install python 3.12
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        python3.12 python3.12-dev python3.12-distutils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip setuptools

USER jovyan

COPY pyproject.toml /home/jovyan/pyproject.toml
RUN curl -sSL https://install.python-poetry.org | python -
RUN poetry install
ENV PYTHONPATH=/home/jovyan:/home/jovyan/.venv/lib/python3.12/site-packages
