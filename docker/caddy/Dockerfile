### VERSIONS METADATA ###
ARG IMAGE_VERSION=2.9.1-rev1
ARG GOLANG_VERSION=1.24.1-alpine3.21
ARG CADDY_VERSION=2.9.1
### END VERSIONS METADATA ###


# Build binary with plugins
FROM golang:${GOLANG_VERSION} AS builder

ARG CADDY_VERSION

WORKDIR /tmp
RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN git clone "https://github.com/caddyserver/caddy.git" && \
    cd caddy && \
    git checkout v${CADDY_VERSION} && \
    go mod download

WORKDIR /tmp/caddy/cmd/caddy
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build \
    --with github.com/caddy-dns/digitalocean \
    --with github.com/shift72/caddy-geo-ip \
    --with github.com/caddy-dns/cloudflare \
    --output /usr/bin/caddy


# Build clear image
FROM caddy:${CADDY_VERSION}-alpine AS caddy

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains a caddy with dns plugins"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/caddy
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/caddy/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}
RUN apk -U upgrade

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
