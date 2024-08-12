# Certbot Docker Image for Nginx

This Docker image is designed to provide Certbot functionality for native Nginx setups, particularly for use within Docker Compose environments.

## Features

- **Nginx Integration**: This image includes Nginx to facilitate the certificate issuance and renewal process.
- **Custom Configuration**: It comes with a custom `cli.ini` file located at `/etc/letsencrypt/cli.ini`, allowing for flexible configuration options.
- **Entry Point Script**: The image includes an `entrypoint.sh` script to manage the initialization and execution of Certbot operations.

## Usage

You can use this Docker image by pulling it from the Docker Hub or by building it locally using the provided Dockerfile.

### Pull from Docker Hub

```bash
docker pull <your-dockerhub-username>/certbot-nginx
```

### Build Locally

```bash
docker build -t certbot-nginx .
```

### Run Container

To run the container, you may use Docker Compose or a similar orchestration tool to integrate Certbot with your Nginx setup. Ensure that you mount the necessary volumes and configure your Nginx server accordingly.

```yaml
version: '3'
services:
  certbot:
    image: certbot-nginx
    volumes:
      - /etc/nginx:/etc/nginx
      - /etc/letsencrypt:/etc/letsencrypt
    # Add other configurations as needed
```

## Additional Information

- **Description**: This image contains Certbot for native Nginx setups within Docker Compose environments.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker/certbot/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images/docker/certbot/Dockerfile)

Feel free to customize this image according to your specific requirements and environment. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.