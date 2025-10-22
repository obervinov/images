# fluentd/Dockerfile
# references:
# - Fluentd: https://docs.fluentd.org/container-deployment/docker-compose
# - Logging to Elasticsearch: https://github.com/elastic/elasticsearch-ruby/blob/main/README.md#compatibility
# - Sending logs to Grafana Loki: https://grafana.com/docs/loki/latest/send-data/fluentd/

FROM fluent/fluentd:edge-debian

ARG IMAGE_VERSION=1.0.0

LABEL org.opencontainers.image.description "This image contains Fluentd with essential plugins for log management."
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/fluentd
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/fluentd/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

USER root

# For healthcheck purposes
RUN apt-get update && apt-get install netcat-openbsd -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Plugins
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document", "--version", "5.4.3"]
RUN ["gem", "install", "fluent-plugin-grafana-loki", "--no-document"]

USER fluent
