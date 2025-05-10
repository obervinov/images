# Docker Images Repository
This repository contains Dockerfiles for building Docker images.

[![PR](https://github.com/obervinov/images/actions/workflows/pr.yaml/badge.svg?branch=main&event=pull_request)](https://github.com/obervinov/images/actions/workflows/pr.yaml)
[![Release](https://github.com/obervinov/images/actions/workflows/release.yaml/badge.svg)](https://github.com/obervinov/images/actions/workflows/release.yaml)

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/obervinov/images?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/obervinov/images?style=for-the-badge)
![GitHub Release Date](https://img.shields.io/github/release-date/obervinov/images?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/obervinov/images?style=for-the-badge)
![GitHub repo size](https://img.shields.io/github/repo-size/obervinov/images?style=for-the-badge)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

## Docker Images

| Image Name    | Description                                         | Readme                                  | Manifest                                   |
|---------------|-----------------------------------------------------|-----------------------------------------|--------------------------------------------|
| caddy         | Docker image for the Caddy web server.              | [README](docker/caddy/README.md)        | [Manifest](docker/caddy/Dockerfile)        |
| certbot       | Docker image for Certbot, the Let's Encrypt client. | [README](docker/certbot/README.md)      | [Manifest](docker/certbot/Dockerfile)      |
| debug         | Docker image for debugging purposes.                | [README](docker/debug/README.md)        | [Manifest](docker/debug/Dockerfile)        |
| glab          | Docker image for GitLab CLI tool.                   | [README](docker/glab/README.md)         | [Manifest](docker/glab/Dockerfile)         |
| ghub          | Docker image for GitHub CLI tool.                   | [README](docker/ghub/README.md)         | [Manifest](docker/ghub/Dockerfile)         |
| gradle        | Docker image for Gradle CI environment.             | [README](docker/gradle/README.md)       | [Manifest](docker/gradle/Dockerfile)       |
| python        | Docker image for Python development.                | [README](docker/python/README.md)       | [Manifest](docker/python/Dockerfile)       |
| vault         | Docker image for HashiCorp Vault.                   | [README](docker/vault/README.md)        | [Manifest](docker/vault/Dockerfile)        |
| backup-tools  | Docker image for backup tools.                      | [README](docker/backup-tools/README.md) | [Manifest](docker/backup-tools/Dockerfile) |
| jupyterhub    | Docker image for JupyterHub user servers.           | [README](docker/jupyterhub/README.md)   | [Manifest](docker/jupyterhub/Dockerfile)   |
| trivy-ui     | Docker image for Trivy web UI.                      | [README](docker/trivy-ui/README.md)     | [Manifest](docker/trivy-ui/Dockerfile)     |
| smartctl-exporter | Docker image for smartctl-exporter.               | [README](docker/smartctl-exporter/README.md) | [Manifest](docker/smartctl-exporter/Dockerfile) |
| popeye        | Docker image for Popeye, a Kubernetes cluster sanitizer. | [README](docker/popeye/README.md)       | [Manifest](docker/popeye/Dockerfile)       |

Each directory under `docker/` corresponds to a specific Docker image. Navigate to each directory to view the respective Dockerfile and README for further instructions.

## License

This project is licensed under the [MIT License](LICENSE).

## <img src="https://github.com/obervinov/_templates/blob/v1.0.5/icons/github-actions.png" width="25" title="github-actions"> GitHub Actions
| Name  | Version |
| ------------------------ | ----------- |
| GitHub Actions Templates | [v2.1.1](https://github.com/obervinov/_templates/tree/v2.1.1) |