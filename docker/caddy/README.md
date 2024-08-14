# Caddy Docker Image with DNS Plugin

This Docker image is designed to provide a custom Caddy server with DNS plugin support. It includes the necessary plugins for DigitalOcean DNS integration.

## Build Process

This Docker image is built in two stages:

1. **Build Binary with Plugins**: This stage fetches the Caddy source code from the official GitHub repository and compiles it with the required plugins. The `xcaddy` tool is used to facilitate this process. The resulting binary is then stored in a temporary location.

2. **Build Clear Image**: This stage utilizes the official `caddy` Docker image as a base. It copies the previously built binary into the final image, ensuring that the Caddy server is ready with the configured plugins.

## Usage

You can use this Docker image by pulling it from the Docker Hub or by building it locally using the provided Dockerfile.

### Pull from Docker Hub

```bash
docker pull <your-dockerhub-username>/caddy-dns
```

### Build Locally

```bash
docker build -t caddy-dns .
```

### Run Container

```bash
docker run -d -p 80:80 -p 443:443 caddy-dns
```

## Additional Information

- **Image Description**: This image contains a Caddy server with DNS plugin support for DigitalOcean.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker/caddy/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images/docker/caddy/Dockerfile)
- **Version**: 2.7.5-alpine

Feel free to customize this image according to your specific requirements and environment. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.