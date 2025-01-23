### VERSIONS METADATA ###
ARG IMAGE_VERSION=1.0.2
ARG ALPINE_VERSION=3.20
ARG GO_VERSION=1.22.5
ARG VAULT_VERSION=1.17.2
### END VERSIONS METADATA ###


# Build vault from source
FROM alpine:${ALPINE_VERSION} AS vault-builder

ARG VAULT_VERSION
ARG TARGETARCH
ENV VAULT_VERSION=${VAULT_VERSION}
ENV PRODUCT=vault
ENV TARGETARCH=${TARGETARCH}
 
RUN apk add --update --no-cache --virtual .deps --no-cache gnupg && \
    cd /tmp && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_linux_${TARGETARCH}.zip && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_SHA256SUMS && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS.sig ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS && \
    grep ${PRODUCT}_${VAULT_VERSION}_linux_${TARGETARCH}.zip ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/${PRODUCT}_${VAULT_VERSION}_linux_${TARGETARCH}.zip -d /tmp && \
    mv /tmp/${PRODUCT} /usr/local/bin/${PRODUCT} && \
    rm -f /tmp/${PRODUCT}_${VAULT_VERSION}_linux_${TARGETARCH}.zip ${PRODUCT}_${VAULT_VERSION}_SHA256SUMS ${VAULT_VERSION}/${PRODUCT}_${VAULT_VERSION}_SHA256SUMS.sig && \
    apk del .deps


# Build rclone from source
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS rclone-builder

ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH}

RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN apk --no-cache add curl unzip
RUN curl -O https://downloads.rclone.org/rclone-current-linux-${TARGETARCH}.zip && \
    unzip rclone-current-linux-${TARGETARCH}.zip && \
    cd rclone-*-linux-${TARGETARCH} && \
    cp rclone /usr/local/bin/ && \
    chown root:root /usr/local/bin/rclone && \
    chmod 755 /usr/local/bin/rclone && \
    rclone version


# Build the final image
FROM alpine:${ALPINE_VERSION}

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains tools for backup and restore data from different sources."
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/backup-tools
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/backup-tools/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

# Update and install necessary packages
RUN apk -U upgrade && \
    apk --no-cache add \
    bash \
    curl \
    openssh-client \
    rsync \
    tar \
    unzip \
    zip \
    postgresql \
    s3cmd \
    rsync

COPY --from=vault-builder /usr/local/bin/vault /usr/local/bin/vault
COPY --from=rclone-builder /usr/local/bin/rclone /usr/local/bin/rclone
