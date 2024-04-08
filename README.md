# Docker Images Repository

This repository contains Dockerfiles for building Docker images.

## Docker Images

| Image Name   | Description                                         | Readme                               | Manifest                                |
|--------------|-----------------------------------------------------|--------------------------------------|-----------------------------------------|
| caddy        | Docker image for the Caddy web server.              | [README](docker/caddy/README.md)     | [Manifest](docker/caddy/Dockerfile)     |
| certbot      | Docker image for Certbot, the Let's Encrypt client. | [README](docker/certbot/README.md)   | [Manifest](docker/certbot/Dockerfile)   |
| debug        | Docker image for debugging purposes.                | [README](docker/debug/README.md)     | [Manifest](docker/debug/Dockerfile)     |
| glab         | Docker image for GitLab CLI tool.                   | [README](docker/glab/README.md)      | [Manifest](docker/glab/Dockerfile)      |
| gradle-ci    | Docker image for Gradle CI environment.             | [README](docker/gradle-ci/README.md) | [Manifest](docker/gradle-ci/Dockerfile) |
| python       | Docker image for Python development.                | [README](docker/python/README.md)    | [Manifest](docker/python/Dockerfile)    |
| vault        | Docker image for HashiCorp Vault.                   | [README](docker/vault/README.md)     | [Manifest](docker/vault/Dockerfile)     |

Each directory under `docker/` corresponds to a specific Docker image. Navigate to each directory to view the respective Dockerfile and README for further instructions.

## License

This project is licensed under the [MIT License](LICENSE).

## <img src="https://github.com/obervinov/_templates/blob/v1.0.5/icons/github-actions.png" width="25" title="github-actions"> GitHub Actions
| Name  | Version |
| ------------------------ | ----------- |
| GitHub Actions Templates | [v1.1.0](https://github.com/obervinov/_templates/tree/v1.1.0) |
