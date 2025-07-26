### VERSIONS METADATA ###
ARG IMAGE_VERSION=1.20.1
ARG VAULT_VERSION=1.20.1
### END VERSIONS METADATA ###


FROM hashicorp/vault:${VAULT_VERSION}

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains vault for my Github Actions"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/vault
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/vault/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]
