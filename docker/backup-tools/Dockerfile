# Build vault from source
FROM golang:1.22.5 AS builder

RUN mkdir -p $GOPATH/src/github.com/hashicorp && \
    cd $_ && \
    git clone https://github.com/hashicorp/vault.git && \
    cd vault && \
    make bootstrap && \
    make dev && \
    vault --version


# Build the final image
FROM alpine:3.20.2

LABEL org.opencontainers.image.description "This image contains tools for backup and restore data from different sources."
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/backup-tools
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/backup-tools/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 1.0.2

# Update and install necessary packages
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
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

COPY --from=builder /go/vault/vault /usr/local/bin/vault

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/local/bin/ && \
    chown root:root /usr/local/bin/rclone && \
    chmod 755 /usr/local/bin/rclone && \
    mkdir -p //usr/local/share/man/man1 && \
    cp rclone.1 /usr/local/share/man/man1/ && \
    mandb
