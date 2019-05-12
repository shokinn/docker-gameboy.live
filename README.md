# docker-gameboy.live
gameboy.live docker package

[![Docker Automated build](https://img.shields.io/docker/automated/shokinn/docker-gameboy.live.svg)](https://hub.docker.com/r/shokinn/docker-gameboy.live/)
[![Docker image version](https://images.microbadger.com/badges/version/shokinn/docker-gameboy.live.svg)](https://microbadger.com/images/shokinn/docker-gameboy.live)
[![Docker image size](https://images.microbadger.com/badges/image/shokinn/docker-gameboy.live.svg)](https://microbadger.com/images/shokinn/docker-gameboy.live)

## Run example

```bash
docker run \
	--name gbdotlive
	-v /docker/gbdotlive_data:/data \
	-p 1989:1989 \
	shokinn/docker-gameboy.live
```