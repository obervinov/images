# Build binary with plugins
FROM golang:1.21.9-alpine3.19 AS builder

WORKDIR /tmp
RUN apk --no-cache add ca-certificates make git && update-ca-certificates
RUN git clone "https://github.com/caddyserver/caddy.git"

WORKDIR /tmp/caddy/cmd/caddy
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build \
    --with github.com/caddy-dns/digitalocean@master \
    --with github.com/mholt/caddy-l4 \
    --output /usr/bin/caddy


# Build clear image
FROM caddy:2.7.5-alpine AS caddy

LABEL org.opencontainers.image.description "This image contains a caddy with dns plugin https://github.com/caddy-dns/digitalocean"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/caddy
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/caddy/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 2.7.5-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
