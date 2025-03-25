### VERSIONS METADATA ###
ARG IMAGE_VERSION=2.9.1
ARG ALPINE_VERSION=3.21.3
ARG GO_VERSION=1.24.1
ARG CADDY_VERSION=2.9.1
### END VERSIONS METADATA ###


# Build binary with plugins
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS builder

WORKDIR /tmp
RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN git clone "https://github.com/caddyserver/caddy.git"

WORKDIR /tmp/caddy/cmd/caddy
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build \
    --with github.com/caddy-dns/digitalocean@master \
    --with github.com/mholt/caddy-l4 \
    --with github.com/shift72/caddy-geo-ip \
    --output /usr/bin/caddy


# Build clear image
FROM caddy:${CADDY_VERSION}-alpine AS caddy

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains a caddy with dns plugin https://github.com/caddy-dns/digitalocean"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/caddy
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/caddy/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}
RUN apk -U upgrade

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
