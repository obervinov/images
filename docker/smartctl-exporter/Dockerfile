ARG ALPINE_VERSION=3.22.2
ARG APP_VERSION=0.14.0
ARG IMAGE_VERSION=0.14.0

FROM alpine:${ALPINE_VERSION} as build
WORKDIR /build
ARG APP_VERSION

RUN apk add --no-cache --update go git build-base
RUN git clone "https://github.com/prometheus-community/smartctl_exporter.git" /build && \
    git checkout v${APP_VERSION}
RUN go build -o smartctl_exporter && chmod +x smartctl_exporter && \
    /build/smartctl_exporter --help


FROM alpine:${ALPINE_VERSION}
ARG IMAGE_VERSION

RUN apk add --no-cache ca-certificates smartmontools && apk upgrade --no-cache && rm -rf /var/cache/apk/*
COPY --from=build /build/smartctl_exporter /bin/smartctl_exporter

LABEL org.opencontainers.image.description "This image contains Smartctl Exporter"
LABEL org.opencontainers.image.url "https://github.com/prometheus-community/smartctl_exporter"
LABEL org.opencontainers.image.documentation "https://github.com/prometheus-community/smartctl_exporter/blob/master/README.md"
LABEL org.opencontainers.image.authors "https://github.com/obervinov"
LABEL org.opencontainers.image.source "https://github.com/prometheus-community/smartctl_exporter"
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

EXPOSE      9633
USER        nobody
ENTRYPOINT  [ "/bin/smartctl_exporter" ]
