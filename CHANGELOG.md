# Change Log
All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).


## v1.4.7 - 2025-06-17
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.4.6...v1.4.7 by @obervinov in https://github.com/obervinov/images/pull/35
#### 🚀 Features
* Add `cloudflare-dns` plugin to the `caddy` image
#### 💥 Breaking Changes
* Remove L4 load balancer plugin from the `caddy` image


## v1.4.6 - 2025-05-15
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.4.5...v1.4.6 by @obervinov in https://github.com/obervinov/images/pull/34
#### 🚀 Features
* Added `parallel` and update dependencies in the `debug` and `backup-tools` images


## v1.4.5 - 2025-05-10
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.4.4...v1.4.5 by @obervinov in https://github.com/obervinov/images/pull/33
#### 🚀 Features
* Add new image `popeye` for Kubernetes cluster resource sanitizer


## v1.4.4 - 2025-04-15
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.4.3...v1.4.4 by @obervinov in https://github.com/obervinov/images/pull/32
#### 🚀 Features
* Add new image `smartctl-exporter` for smartctl exporter
* Switch source repository for `trivy-ui` image to `locustbaby/trivy-ui`


## v1.4.3 - 2025-03-28
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.4.2...v1.4.3 by @obervinov in https://github.com/obervinov/images/pull/31
#### 🚀 Features
* Add new image `trivy-ui` for Trivy web UI


## v1.4.2 - 2025-03-25
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.4.1...v1.4.2 by @obervinov in https://github.com/obervinov/images/pull/30
#### 🚀 Features
* Bump dependencies in the `Caddy` image
* Add geoip module to the `Caddy` image
#### 🐛 Bug Fixes
* Small improvements in the `JupyterHub` image


## v1.4.1 - 2025-02-18
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.4.0...v1.4.1 by @obervinov in https://github.com/obervinov/images/pull/29
#### 🚀 Features
* Add additional dependencies to the `jupyterhub` image


## v1.4.0 - 2025-02-11
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.3.0...v1.4.0 by @obervinov in https://github.com/obervinov/images/pull/28
#### 🚀 Features
* Add custom JupyterHub image for user servers
* Bump workflow version to `2.1.1`
* Migration images Actions to matrix strategy in the local workflow


## v1.3.0 - 2025-01-29
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.2.0...v1.3.0 by @obervinov in https://github.com/obervinov/images/pull/25
#### 🚀 Features
* Add support multi-arch build for `ghub` and `backup-tools` images
* Bump workflow version to `2.1.0`


## v1.2.0 - 2025-01-22
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.1.3...v1.2.0 by @obervinov in https://github.com/obervinov/images/pull/24
#### 🚀 Features
* Add `ghub` image for GitHub self-hosted runners
* Bump workflow version to `2.0.2`
#### 📚 Documentation
* [Add GH Actions widgets to README.md](https://github.com/obervinov/images/issues/4)


## v1.1.3 - 2024-08-14
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.1.2...v1.1.3 by @obervinov in https://github.com/obervinov/images/pull/20
#### 🚀 Features
* Add `rclone` and `vault` in backup-tools image
* Bump base images version
* Bump workflow version to `1.2.8`
* Small improvements in the Dockerfiles
#### 🐛 Bug Fixes
* [Fix code scanning alert - golang: net/netip: Unexpected behavior from Is methods for IPv4-mapped IPv6 addresses](https://github.com/obervinov/images/issues/10)
* [Fix code scanning alert - golang: html/template: improper handling of JavaScript whitespace](https://github.com/obervinov/images/issues/11)
* [Fix code scanning alert - zlib: integer overflow and resultant heap-based buffer overflow in zipOpenNewFileInZip4_6](https://github.com/obervinov/images/issues/12)
* [Fix code scanning alert - OpenEXR: Heap Overflow in Scanline Deep Data Parsing](https://github.com/obervinov/images/issues/13)
* [Fix code scanning alert - expat: Integer overflow in storeRawNames](https://github.com/obervinov/images/issues/19)
* [Fix code scanning alert - busybox: stack overflow vulnerability in ash.c leads to arbitrary code execution](https://github.com/obervinov/images/issues/17)
* [Fix code scanning alert - git: Recursive clones RCE](https://github.com/obervinov/images/issues/16)
* [Fix code scanning alert - aom: heap-buffer-overflow on frame size change](https://github.com/obervinov/images/issues/15)
* [Fix code scanning alert - libaom: Integer overflow in internal function img_alloc_helper](https://github.com/obervinov/images/issues/14)


## v1.1.2 - 2024-07-25
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.1.1...v1.1.2 by @obervinov in https://github.com/obervinov/images/pull/9
#### 🚀 Features
* Add `jq` and `jwt` tools in debug image
* Bump workflow version to `1.2.6`


## v1.1.1 - 2024-04-12
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.1.0...v1.1.1 by @obervinov in https://github.com/obervinov/images/pull/3
#### 🚀 Features
* [Add rsync in debug and backup-tools images](https://github.com/obervinov/images/pull/3)


## v1.1.0 - 2024-04-11
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/compare/v1.0.0...v1.1.0 by @obervinov in https://github.com/obervinov/images/pull/2
#### 🚀 Features
* [Add image with backup tools](https://github.com/obervinov/images/pull/2)


## v1.0.0 - 2024-04-10
### What's Changed
**Full Changelog**: https://github.com/obervinov/images/commits/v1.0.0
#### 💥 Breaking Changes
* repository: Initial commit.
