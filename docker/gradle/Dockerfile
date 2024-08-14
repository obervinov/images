### VERSIONS METADATA ###
ARG IMAGE_VERSION=1.0.1
ARG ALPINE_VERSION=3.20
ARG GO_VERSION=1.22.5
ARG VAULT_VERSION=1.17.2
### END VERSIONS METADATA ###


# Download vault binary
FROM alpine:${ALPINE_VERSION} AS vault-builder

ARG VAULT_VERSION
ENV VAULT_VERSION=${VAULT_VERSION}
ENV PRODUCT=vault
 
RUN apk add --update --no-cache --virtual .deps --no-cache gnupg && \
    cd /tmp && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_linux_amd64.zip && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_SHA256SUMS && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS.sig ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS && \
    grep ${PRODUCT}_${VAULT_VERSION}_linux_amd64.zip ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/${PRODUCT}_${VAULT_VERSION}_linux_amd64.zip -d /tmp && \
    mv /tmp/${PRODUCT} /usr/local/bin/${PRODUCT} && \
    rm -f /tmp/${PRODUCT}_${VAULT_VERSION}_linux_amd64.zip ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS ${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_SHA256SUMS.sig && \
    apk del .deps


FROM gradle:alpine

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains ci utilities for building gradle projects"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/gradle-ci
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/gradle-ci/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

# Install dependencies
RUN apk add --no-cache \
        curl \
        openssl \
        bash

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mkdir -p ~/.local/bin && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

COPY --from=vault-builder /usr/local/bin/vault /usr/local/bin/vault
