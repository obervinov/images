ARG GOLANG_VERSION=1.24.2
ARG ALPINE_VERSION=3.21
ARG IMAGE_VERSION=0.22.2-dev

FROM golang:${GOLANG_VERSION}-alpine${ALPINE_VERSION} AS build
WORKDIR /app
RUN apk update && apk add --no-cache make git gcc libc-dev curl ca-certificates binutils-gold
RUN git clone "https://github.com/obervinov/popeye.git" && cd popeye && git checkout ac794e79ee69c3b51ab0af586a3d7d781bbd2124
WORKDIR /app/popeye
RUN make build


FROM alpine:${ALPINE_VERSION}

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains Popeye - a utility to help you (k8s) cluster operators and admins to identify potential issues with your Kubernetes clusters."
LABEL org.opencontainers.image.url "https://github.com/obervinov/images/popeye"
LABEL org.opencontainers.image.documentation "https://github.com/derailed/popeye/blob/main/README.md"
LABEL org.opencontainers.image.authors "https://github.com/obervinov"
LABEL org.opencontainers.image.source "https://github.com/derailed/popeye"
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /app/popeye/execs/popeye /bin/popeye

RUN adduser -u 5000 -D nonroot
USER 5000

ENTRYPOINT [ "/bin/popeye" ]
