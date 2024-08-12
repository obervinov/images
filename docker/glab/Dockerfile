# Build release-cli from source
FROM golang:1.22.5-alpine3.20 AS realese-cli-builder

# Install dependencies
RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN git clone https://gitlab.com/gitlab-org/release-cli.git

# Build binary
WORKDIR /go/release-cli
RUN make build


# Download vault binary
FROM alpine:3.20.2 AS vault-builder 

ENV VAULT_VERSION=1.17.2
ENV PRODUCT=vault
 
RUN apk add --update --no-cache --virtual .deps --no-cache gnupg && \
    cd /tmp && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_linux_amd64.zip && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify ${PRODUCT}_${VERSION}_SHA256SUMS.sig ${PRODUCT}_${VERSION}_SHA256SUMS && \
    grep ${PRODUCT}_${VERSION}_linux_amd64.zip ${PRODUCT}_${VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/${PRODUCT}_${VERSION}_linux_amd64.zip -d /tmp && \
    mv /tmp/${PRODUCT} /usr/local/bin/${PRODUCT} && \
    rm -f /tmp/${PRODUCT}_${VERSION}_linux_amd64.zip ${PRODUCT}_${VERSION}_SHA256SUMS ${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS.sig && \
    apk del .deps


# Build the final image
FROM alpine:3.20.2

LABEL org.opencontainers.image.description "This image contains utilities for automating work with gitlab"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker-/glab
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker-/glab/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 1.0.1

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