# fluentd/Dockerfile
# references:
# - Fluentd: https://docs.fluentd.org/container-deployment/docker-compose
# - Logging to Elasticsearch: https://github.com/elastic/elasticsearch-ruby/blob/main/README.md#compatibility
# - Sending logs to Grafana Loki: https://grafana.com/docs/loki/latest/send-data/fluentd/

FROM fluent/fluentd:edge-debian
USER root

RUN ["gem", "install", "elasticsearch", "--no-document", "--version", "8.17.1"]
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document", "--version", "5.4.3"]

RUN ["gem", "install", "fluent-plugin-grafana-loki", "--no-document"]
USER fluent
