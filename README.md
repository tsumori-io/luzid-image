# Luzid Validator

A containerised Luzid validator node (backend).

## Build container

```sh
docker build -t ghcr.io/tsumori-io/luzid-validator:latest .
```

## Pull container

```sh
docker pull ghcr.io/tsumori-io/luzid-validator:latest
```

## Run container

```sh
docker run --platform=linux/amd64 --rm -it --name luzid -p 60061:60061 --entrypoint /bin/bash ghcr.io/tsumori-io/luzid-validator:latest
```

# Luzid binaries

The latest release binaries can be found at https://github.com/luzid-app/luzid-sdk/releases
