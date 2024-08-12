# Docker Images Repository

This repository contains Dockerfiles for building Docker images.

## Docker Images

| Image Name    | Description                                         | Readme                                  | Manifest                                   |
|---------------|-----------------------------------------------------|-----------------------------------------|--------------------------------------------|
| caddy         | Docker image for the Caddy web server.              | [README](docker/caddy/README.md)        | [Manifest](docker/caddy/Dockerfile)        |
| certbot       | Docker image for Certbot, the Let's Encrypt client. | [README](docker/certbot/README.md)      | [Manifest](docker/certbot/Dockerfile)      |
| debug         | Docker image for debugging purposes.                | [README](docker/debug/README.md)        | [Manifest](docker/debug/Dockerfile)        |
| glab          | Docker image for GitLab CLI tool.                   | [README](docker/glab/README.md)         | [Manifest](docker/glab/Dockerfile)         |
| gradle        | Docker image for Gradle CI environment.             | [README](docker/gradle/README.md)       | [Manifest](docker/gradle/Dockerfile)       |
| python        | Docker image for Python development.                | [README](docker/python/README.md)       | [Manifest](docker/python/Dockerfile)       |
| vault         | Docker image for HashiCorp Vault.                   | [README](docker/vault/README.md)        | [Manifest](docker/vault/Dockerfile)        |
| backup-tools  | Docker image for backup tools.                      | [README](docker/backup-tools/README.md) | [Manifest](docker/backup-tools/Dockerfile) |

Each directory under `docker/` corresponds to a specific Docker image. Navigate to each directory to view the respective Dockerfile and README for further instructions.

## License

This project is licensed under the [MIT License](LICENSE).

## <img src="https://github.com/obervinov/_templates/blob/v1.0.5/icons/github-actions.png" width="25" title="github-actions"> GitHub Actions
| Name  | Version |
| ------------------------ | ----------- |
| GitHub Actions Templates | [v1.2.7](https://github.com/obervinov/_templates/tree/v1.2.7) |