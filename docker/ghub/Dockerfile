### VERSIONS METADATA ###
ARG NODE_VERSION=24.4.1
ARG IMAGE_VERSION=1.0.0
ARG TARGETARCH


# Build the final image
FROM node:${NODE_VERSION}-slim
ARG IMAGE_VERSION

LABEL org.opencontainers.image.description="This image contains utilities for automating work with github actions"
LABEL org.opencontainers.image.url=https://github.com/obervinov/images/docker-/ghub
LABEL org.opencontainers.image.documentation=https://github.com/obervinov/images/docker-/ghub/README.md
LABEL org.opencontainers.image.authors=https://github.com/obervinov
LABEL org.opencontainers.image.source=https://github.com/obervinov/images
LABEL org.opencontainers.image.version=${IMAGE_VERSION}

# Update dependencies
RUN apt-get update && apt-get -y upgrade && apt-get install -y \
    gnupg \
    software-properties-common \
    wget \
    curl \
    tar \
    coreutils \
    git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
# Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null && \
    gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && apt-get install -y terraform && \
    terraform --version
# Validators
RUN arch=$(dpkg --print-architecture) && echo "ARCH: $arch" && \
    curl -L "$(curl -s https://api.github.com/repos/tenable/terrascan/releases/latest | grep -o -E "https://.+?_Linux_${arch}.tar.gz")" > terrascan.tar.gz && \
    tar -xf terrascan.tar.gz terrascan && rm terrascan.tar.gz && \
    install terrascan /usr/local/bin && rm terrascan && \
    terrascan version

# GitHub CLI
RUN mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y
