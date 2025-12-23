ARG NODE_VERSION=25.2.1-alpine3.22
ARG NGINX_VERSION=1.29.3
ARG APP_VERSION=2.1.0
ARG IMAGE_VERSION=1.0.0


FROM node:${NODE_VERSION} AS build

WORKDIR /usr/src/app
ARG APP_VERSION
ENV APP_VERSION=${APP_VERSION}

RUN apk add --no-cache git && \
    git clone --depth 1 --branch v${APP_VERSION} https://github.com/leviarista/github-profile-header-generator.git .
RUN npm install
RUN npm run build


FROM nginx:${NGINX_VERSION}-alpine
ARG IMAGE_VERSION
COPY --from=build /usr/src/app/conf/default.conf /etc/nginx/conf.d/
COPY --from=build /usr/src/app/dist /usr/share/nginx/html

LABEL org.opencontainers.image.description "This image contains a github profile header generator web application"
LABEL org.opencontainers.image.url "https://github.com/leviarista/github-profile-header-generator"
LABEL org.opencontainers.image.documentation "https://github.com/leviarista/github-profile-header-generator/blob/main/README.md"
LABEL org.opencontainers.image.authors "https://github.com/obervinov"
LABEL org.opencontainers.image.source "https://github.com/leviarista/github-profile-header-generator"
LABEL org.opencontainers.image.version "${IMAGE_VERSION}"
