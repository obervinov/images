ARG NODE_VERSION=23.10.0-alpine3.21
ARG GOLANG_VERSION=1.24.1-bullseye
ARG IMAGE_VERSION=0.1.1

FROM golang:${GOLANG_VERSION} AS build
WORKDIR /app
RUN apt update && apt install -y curl git \
    && curl -fsSL https://deb.nodesource.com/setup_23.x | bash - \
    && apt install -y nodejs \
    && npm install -g npm@latest \
    && rm -rf /var/lib/apt/lists/*
RUN git clone "https://github.com/locustbaby/trivy-ui.git" && cd trivy-ui
RUN cd trivy-ui/go-server && go build -o go-server
RUN cd trivy-ui/trivy-dashboard && npm install && npm run build


FROM debian:bullseye-slim

ARG IMAGE_VERSION

WORKDIR /app
COPY --from=build /app/trivy-ui/go-server/go-server /app/go-server
COPY --from=build /app/trivy-ui/trivy-dashboard/dist /app/trivy-dashboard/dist
RUN apt update && apt install -y ca-certificates && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.description "This image contains Trivy UI"
LABEL org.opencontainers.image.url "https://github.com/llocustbaby/trivy-ui"
LABEL org.opencontainers.image.documentation "https://github.com/locustbaby/trivy-ui/blob/main/README.md"
LABEL org.opencontainers.image.authors "https://github.com/obervinov"
LABEL org.opencontainers.image.source "https://github.com/locustbaby/trivy-ui"
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

CMD ["/app/go-server"]
EXPOSE 8080
