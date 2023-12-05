# docker-coredns

[![github-actions](https://github.com/theohbrothers/docker-coredns/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-coredns/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-coredns?style=flat-square)](https://github.com/theohbrothers/docker-coredns/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-coredns/latest)](https://hub.docker.com/r/theohbrothers/docker-coredns)

Dockerized [coredns](https://github.com/coredns/coredns).

Whereas [official coredns docker image](https://hub.docker.com/r/coredns/coredns) is based on a scratch image, this image based on Alpine. This slight improvement enables shell scripts to be used as the entrypoint, to help to dynamically generate `coredns` config files, and help with debugging. The `coredns` binaries are sourced from their official images.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:1.25.3`, `:latest` | [View](variants/1.25.3) |
| `:1.24.0` | [View](variants/1.24.0) |
| `:1.23.4` | [View](variants/1.23.4) |


## Usage

```sh
docker run --rm -it -p 3128:3128 theohbrothers/docker-nginx-forward-proxy:latest
curl -x http://127.0.0.1:3128 http://example.com
curl -x http://127.0.0.1:3128 https://example.com
```

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```

### Variant versions

[versions.json](generate/definitions/versions.json) contains a list of [Semver](https://semver.org/) versions, one per line.

To update versions in `versions.json`:

```powershell
./Update-Versions.ps1
```

To update versions in `versions.json`, and open a PR for each changed version, and merge successful PRs one after another (to prevent merge conflicts), and finally create a tagged release and close milestone:

```powershell
$env:GITHUB_TOKEN = 'xxx'
./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
```

To perform a dry run, use `-WhatIf`.
