# Python Tools Docker Image

This Docker image is designed to facilitate running Python scripts and tools.

## Features

- **Python Environment**: The image provides a Python environment suitable for running scripts and tools.
- **Additional Utilities**: It includes common utilities such as `git`, `curl`, `wget`, `vim`, and `mc` (Midnight Commander) to aid in development and debugging.

## Python Packages

- `requests`: A Python library for making HTTP requests.

## Usage

You can use this Docker image by pulling it from the Docker Hub or by building it locally using the provided Dockerfile.

### Pull from Docker Hub

```bash
docker pull <your-dockerhub-username>/python-tools
```

### Build Locally

```bash
docker build -t python-tools .
```

### Run Container

To run the container, you can execute the following command:

```bash
docker run -it <your-dockerhub-username>/python-tools /bin/bash
```

## Additional Information

- **Description**: This image is used for running Python scripts and tools.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker/python/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images)

Feel free to customize this image according to your specific requirements and environment. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.