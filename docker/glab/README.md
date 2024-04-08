# Glab Docker Image

This Docker image provides utilities for automating work with GitLab.

## Image Details

- **Base Image**: `golang:1.19.1-alpine3.16` (Builder stage), `alpine:3.18.2` (Final stage)
- **Version**: 1.0.0

## Features

- **Automated GitLab Work**: The image includes tools for automating various tasks related to GitLab.
- **Utilities**: It comes pre-installed with essential utilities such as `glab`, `curl`, `git`, `vault`, `bash`, `aws-cli`, and `helm`.

## Build Process

This Docker image is built in two stages:

1. **Builder Stage**: This stage utilizes the `golang:1.19.1-alpine3.16` base image to compile the `release-cli` utility from the provided source code. It installs necessary dependencies, copies the source code, and builds the binary.
   
2. **Final Stage**: This stage uses the `alpine:3.18.2` base image and installs additional dependencies required for running the utilities. It copies the compiled `release-cli` binary from the builder stage and sets up SSL certificates.

## Usage

You can use this Docker image by pulling it from the Docker Hub or by building it locally using the provided Dockerfile.

### Pull from Docker Hub

```bash
docker pull <your-dockerhub-username>/glab
```

### Build Locally

```bash
docker build -t glab .
```

### Run Container

To run the container, you can execute the following command:

```bash
docker run -it <your-dockerhub-username>/glab /bin/bash
```

## Additional Information

- **Description**: This image contains utilities for automating work with GitLab.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker-/glab/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images/docker-/glab/Dockerfile)

Feel free to customize this image according to your specific requirements and environment. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.