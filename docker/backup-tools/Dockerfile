### VERSIONS METADATA ###
ARG IMAGE_VERSION=1.0.2
ARG ALPINE_VERSION=3.20.2
ARG GO_VERSION=1.22.5
### END VERSIONS METADATA ###


# Build vault from source
FROM alpine:${ALPINE_VERSION} AS vault-builder

ENV VERSION=1.17.2
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


# Build rclone from source
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS rclone-builder

RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN apk --no-cache add curl unzip
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/local/bin/ && \
    chown root:root /usr/local/bin/rclone && \
    chmod 755 /usr/local/bin/rclone && \
    mkdir -p //usr/local/share/man/man1 && \
    cp rclone.1 /usr/local/share/man/man1/ && \
    mandb


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
