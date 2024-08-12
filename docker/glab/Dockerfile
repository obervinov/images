FROM golang:1.22.5-alpine3.20 AS builder

# Install dependencies
RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN git clone https://gitlab.com/gitlab-org/release-cli.git

# Build binary
WORKDIR /go/release-cli
RUN make build



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
    vault \
    bash \
    aws-cli \
    helm

COPY --from=builder /go/release-cli/bin/release-cli /usr/local/bin/release-cli
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/