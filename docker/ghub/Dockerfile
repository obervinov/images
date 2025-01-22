### VERSIONS METADATA ###
ARG IMAGE_VERSION=0.1.0
ARG ALPINE_VERSION=3.21.2
ARG VAULT_VERSION=1.18.3
ARG TF_VERSION=1.9.8


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

# Download terraform binary
FROM alpine:${ALPINE_VERSION} AS terraform-builder

ARG TF_VERSION
ENV TF_VERSION=${TF_VERSION}
ENV PRODUCT=terraform
RUN apk add --update --virtual .deps --no-cache gnupg && \
    cd /tmp && \
    wget https://releases.hashicorp.com/${PRODUCT}/${TF_VERSION}/${PRODUCT}_${TF_VERSION}_linux_amd64.zip && \
    wget https://releases.hashicorp.com/${PRODUCT}/${TF_VERSION}/${PRODUCT}_${TF_VERSION}_SHA256SUMS && \
    wget https://releases.hashicorp.com/${PRODUCT}/${TF_VERSION}/${PRODUCT}_${TF_VERSION}_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify ${PRODUCT}_${TF_VERSION}_SHA256SUMS.sig ${PRODUCT}_${TF_VERSION}_SHA256SUMS && \
    grep ${PRODUCT}_${TF_VERSION}_linux_amd64.zip ${PRODUCT}_${TF_VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/${PRODUCT}_${TF_VERSION}_linux_amd64.zip -d /tmp && \
    mv /tmp/${PRODUCT} /usr/local/bin/${PRODUCT} && \
    rm -f /tmp/${PRODUCT}_${TF_VERSION}_linux_amd64.zip ${PRODUCT}_${TF_VERSION}_SHA256SUMS ${TF_VERSION}/${PRODUCT}_${TF_VERSION}_SHA256SUMS.sig && \
    apk del .deps

# Build the final image
FROM alpine:${ALPINE_VERSION}

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains utilities for automating work with gitlab"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker-/glab
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker-/glab/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

RUN apk -U upgrade && apk add --no-cache \
    curl \
    git \
    bash

COPY --from=vault-builder /usr/local/bin/vault /usr/local/bin/vault
COPY --from=terraform-builder /usr/local/bin/terraform /usr/local/bin/terraform