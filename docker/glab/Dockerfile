FROM golang:1.19.1-alpine3.16 AS builder

RUN apk --no-cache add ca-certificates make git && update-ca-certificates
COPY ./release-cli /release-cli
WORKDIR /release-cli
RUN make build



FROM alpine:3.18.2

LABEL org.opencontainers.image.description "This image contains utilities for automating work with gitlab"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker-/glab
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker-/glab/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 1.0.0

RUN apk add --no-cache \
            glab \
            curl \
            git \
            vault \
            bash \
            aws-cli \
            helm

COPY --from=builder /release-cli/bin/release-cli /usr/local/bin/release-cli
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/