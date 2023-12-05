@"
# docker-nginx-forward-proxy

[![github-actions](https://github.com/theohbrothers/docker-nginx-forward-proxy/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-nginx-forward-proxy/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-nginx-forward-proxy?style=flat-square)](https://github.com/theohbrothers/docker-nginx-forward-proxy/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-nginx-forward-proxy/latest)](https://hub.docker.com/r/theohbrothers/docker-nginx-forward-proxy)

The ``nginx-foward-proxy`` is a so simple HTTP proxy server using the nginx, using [``ngx_http_proxy_connect_module``](https://github.com/chobits/ngx_http_proxy_connect_module).

You can easily build a HTTP proxy server using this.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
$(
($VARIANTS | % {
    if ( $_['tag_as_latest'] ) {
@"
| ``:$( $_['tag'] )``, ``:latest`` | [View](variants/$( $_['tag'] )) |

"@
    }else {
@"
| ``:$( $_['tag'] )`` | [View](variants/$( $_['tag'] )) |

"@
    }
}) -join ''
)

"@

@'

## Usage

```sh
docker run --rm -it -p 3128:3128 theohbrothers/docker-nginx-forward-proxy:latest
curl -x http://127.0.0.1:3128 http://example.com
curl -x http://127.0.0.1:3128 https://example.com
```

### Environment variables

| Name | Description | Default value | Example value |
|:---:|:---:|:---:|:---:|
| `RESOLVER` | `resolver` directive in `nginx.conf` | `1.1.1.1 ipv6=off` | `127.0.0.11 ipv6=off` |

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

## Credits

- [@hinata](https://github.com/hinata) for the original fork: https://github.com/hinata/nginx-forward-proxy

'@
