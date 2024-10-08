### VERSIONS METADATA ###
ARG IMAGE_VERSION=1.0.1
ARG ALPINE_VERSION=3.20
ARG GO_VERSION=1.22.5
ARG VAULT_VERSION=1.17.2
### END VERSIONS METADATA ###


# Build release-cli from source
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS realese-cli-builder

# Install dependencies
RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN git clone https://gitlab.com/gitlab-org/release-cli.git

# Build binary
WORKDIR /go/release-cli
RUN make build


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
    glab \
    curl \
    git \
    bash \
    aws-cli \
    helm

COPY --from=realese-cli-builder /go/release-cli/bin/release-cli /usr/local/bin/release-cli
COPY --from=realese-cli-builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=vault-builder /usr/local/bin/vault /usr/local/bin/vault