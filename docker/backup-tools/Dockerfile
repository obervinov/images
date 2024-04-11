FROM alpine:3.19.1

LABEL org.opencontainers.image.description "This image contains tools for backup and restore data from different sources."
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/backup-tools
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/backup-tools/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 1.0.0

# Install tools for backup and restore
RUN apk --no-cache add \
    bash \
    curl \
    openssh-client \
    rsync \
    tar \
    unzip \
    zip \
    postgresql \
    s3cmd
