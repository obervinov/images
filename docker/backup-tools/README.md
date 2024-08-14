# Backup Tools Docker Image

This Docker image contains a collection of tools for backing up and restoring data from various sources.

## Features

- **Supported Tools**: This image includes the following tools:
  - `bash`: Command-line shell and scripting language.
  - `curl`: Command-line tool for transferring data with URLs.
  - `openssh-client`: Secure Shell (SSH) client.
  - `rsync`: Utility for efficiently transferring and synchronizing files between systems.
  - `tar`: Utility for packaging files together into a single archive.
  - `unzip`: Utility for extracting compressed files in ZIP format.
  - `zip`: Utility for creating ZIP archives.
  - `postgresql`: PostgreSQL client for interacting with PostgreSQL databases.
  - `s3cmd`: Command-line tool for managing Amazon S3 and other S3-compatible cloud storage services.
  - `rsync`: Utility for efficiently transferring and synchronizing files between systems.
  - `rclone`: Command-line program to manage files on cloud storage.
  - `vault`: A tool for managing secrets.

## Usage

To use this image, you can pull it from Docker Hub using the following command:

```bash
docker pull obervinov/images/backup-tools:1.0.2
```

Once pulled, you can run containers based on this image and use the included tools for backup and restore operations.

## Source

The source code for this Docker image is available on [GitHub](https://github.com/obervinov/images/docker/backup-tools). You can also find documentation and additional information in the repository.

## Version

This README corresponds to version 1.0.0 of the Docker image.

## Author

This Docker image was created and is maintained by [obervinov](https://github.com/obervinov).
