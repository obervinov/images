FROM ubuntu:23.10

LABEL org.opencontainers.image.description "This image contains all the necessary utilities to investigate the problems of kubernetes virtual services"
LABEL org.opencontainers.image.url https://github.com/obervinov/images/docker/debug
LABEL org.opencontainers.image.documentation https://github.com/obervinov/images/docker/debug/README.md
LABEL org.opencontainers.image.authors https://github.com/obervinov
LABEL org.opencontainers.image.source https://github.com/obervinov/images
LABEL org.opencontainers.image.version 1.0.7

RUN apt-get update && apt-get install -y \
    software-properties-common \
    nmap \
    netcat-traditional \
    openssh-client \
    tcpdump \
    curl \
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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://github.com/mike-engel/jwt-cli/releases/download/6.1.0/jwt-linux.tar.gz -o jwt-linux.tar.gz &&\
    tar -xvf jwt-linux.tar.gz &&\
    mv jwt /usr/local/bin/jwt

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&\
    unzip awscliv2.zip &&\
    ./aws/install

RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 &&\
    chmod a+x /usr/local/bin/yq

ENTRYPOINT ["tail", "-f", "/dev/null"]
