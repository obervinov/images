# Gradle CI Docker Image

This Docker image provides CI utilities for building Gradle projects.

## Image Details

- **Base Image**: `gradle:alpine`
- **Version**: v1.0.0

## Features

- **Gradle Support**: The image includes Gradle and provides an environment suitable for building Gradle projects.
- **Additional Utilities**: It comes with additional utilities such as `curl`, `openssl`, `vault`, `bash`, `kubectl`, and `helm`, which are commonly used in CI/CD pipelines for Kubernetes deployments.

## Included Tools

- `kubectl`: Kubernetes command-line tool.
- `helm`: Kubernetes package manager.
- Other utilities: `curl`, `openssl`, `vault`, `bash`.

## Usage

You can use this Docker image by pulling it from the Docker Hub or by building it locally using the provided Dockerfile.

### Pull from Docker Hub

```bash
docker pull <your-dockerhub-username>/gradle-ci
```

### Build Locally

```bash
docker build -t gradle-ci .
```

### Run Container

To run the container, you can execute the following command:

```bash
docker run -it <your-dockerhub-username>/gradle-ci /bin/bash
```

## Additional Information

- **Description**: This image contains CI utilities for building Gradle projects.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker/gradle-ci/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images)

Feel free to customize this image according to your specific requirements and environment. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.