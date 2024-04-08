FROM gradle:alpine

LABEL org.opencontainers.image.description "This image contains ci utilities for building gradle projects"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/gradle-ci
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/gradle-ci/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version v1.0.0

RUN apk add --no-cache \
        curl \
        openssl \
        vault \
        bash

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mkdir -p ~/.local/bin && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh
