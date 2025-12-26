### VERSIONS METADATA ###
ARG IMAGE_VERSION=1.0.10
ARG UBUNTU_VERSION=26.04
### END VERSIONS METADATA ###


FROM ubuntu:${UBUNTU_VERSION}

ARG IMAGE_VERSION

LABEL org.opencontainers.image.description "This image contains all the necessary utilities to investigate the problems of kubernetes virtual services"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/debug
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/debug/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version ${IMAGE_VERSION}

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-transport-https ca-certificates gnupg curl 

# ClickHouse repo
RUN curl -fsSL 'https://packages.clickhouse.com/rpm/lts/repodata/repomd.xml.key' | gpg --dearmor -o /usr/share/keyrings/clickhouse-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg] https://packages.clickhouse.com/ubuntu/ focal main" | tee /etc/apt/sources.list.d/clickhouse.list && \
    ARCH=$(dpkg --print-architecture) && \
    echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg arch=${ARCH}] https://packages.clickhouse.com/deb stable main" | tee /etc/apt/sources.list.d/clickhouse.list && \
    apt-get update

RUN apt-get install -y \
    software-properties-common \
    nmap \
    netcat-traditional \
    openssh-client \
    tcpdump \
    wget \
    strace \
    inetutils-ping \
    telnet \
    traceroute \
    postgresql-client \
    vim \
    mc \
    net-tools \
    dnsutils \
    rsync \
    jq \
    parallel \
    clickhouse-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY bin/ /usr/local/bin/

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
    unzip awscliv2.zip &&\
    ./aws/install

RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 &&\
    chmod a+x /usr/local/bin/yq

ENTRYPOINT ["tail", "-f", "/dev/null"]
