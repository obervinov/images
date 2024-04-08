# Vault Docker Image

This Docker image contains Vault for use in GitHub Actions workflows.

## Image Details

- **Base Image**: `vault:1.13.2`
- **Version**: 1.13.2

## Features

- **Vault**: The image includes HashiCorp Vault, a tool for managing secrets and protecting sensitive data.

## Usage

You can use this Docker image by pulling it from the Docker Hub or by referencing it directly in your GitHub Actions workflows.

### Pull from Docker Hub

```bash
docker pull <your-dockerhub-username>/vault
```

### Usage in GitHub Actions

```yaml
jobs:
  vault:
    runs-on: ubuntu-latest
    container:
      image: <your-dockerhub-username>/vault
    steps:
      - name: Start Vault
        run: vault server
```

## Additional Information

- **Description**: This image contains Vault for use in GitHub Actions workflows.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker/vault/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images)

Feel free to customize this image according to your specific requirements and environment. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.
