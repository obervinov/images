# Debugging Tools Docker Image

This Docker image provides a collection of utilities essential for investigating problems related to Kubernetes virtual services.

## Image Details

- **Base Image**: `ubuntu:23.10`
- **Version**: 1.0.5

## Included Utilities

- `software-properties-common`
- `nmap`
- `netcat-traditional`
- `openssh-client`
- `tcpdump`
- `curl`
- `wget`
- `strace`
- `inetutils-ping`
- `telnet`
- `traceroute`
- `postgresql-client`
- `vim`
- `mc` (Midnight Commander)
- `net-tools`
- `dnsutils`
- `awscli` (Amazon Web Services Command Line Interface)
- `yq` (YAML processor)

## Usage

You can utilize this Docker image for debugging purposes by pulling it from the Docker Hub or by building it locally using the provided Dockerfile.

### Pull from Docker Hub

```bash
docker pull <your-dockerhub-username>/debug-tools
```

### Build Locally

```bash
docker build -t debug-tools .
```

### Run Container

Start a container based on this image and access the debugging tools interactively.

```bash
docker run -it <your-dockerhub-username>/debug-tools /bin/bash
```

## Additional Information

- **Description**: This image contains various debugging utilities necessary for investigating Kubernetes virtual services issues.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker/debug/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images/docker/debug/Dockerfile)

Feel free to customize this image according to your specific debugging needs. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.