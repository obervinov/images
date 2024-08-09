FROM certbot/certbot:v2.11.0

LABEL org.opencontainers.image.description "This image contains a cerbot for native nginx work in docker-compose"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/certbot
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/certbot/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 2.11.0

RUN apk add --no-cache nginx

COPY cli.ini /etc/letsencrypt/cli.ini
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
