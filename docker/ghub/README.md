# GitHub Actions Docker Image

This Docker image provides utilities for automating work with GitHub self-hosted runners.

## Features
- **Utilities**: It comes pre-installed with essential utilities such as `terraform`, `curl`, `git`, `vault`, `bash`.

## Build Process

This Docker image is built in two stages:

1. **Builder Stage**: This stage installs necessary dependencies, copies the source code, and builds the binary.
   
2. **Final Stage**: This stage uses the `alpine` base image and installs additional dependencies required for running the utilities.


## Additional Information

- **Description**: This image contains utilities for automating work with GitHub self-hosted runners.
- **Documentation**: [GitHub Repository](https://github.com/obervinov/images/docker-/ghub/README.md)
- **Author**: [obervinov](https://github.com/obervinov)
- **Source Code**: [GitHub Repository](https://github.com/obervinov/images/docker-/ghub/Dockerfile)

Feel free to customize this image according to your specific requirements and environment. If you encounter any issues or have suggestions for improvements, please don't hesitate to contribute to the GitHub repository.