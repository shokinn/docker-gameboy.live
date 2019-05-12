# docker-gameboy.live
gameboy.live docker package

## Run example

```bash
docker run \
	--name gbdotlive
	-v /docker/gbdotlive_data:/data \
	-p 1989:1989 \
	shokinn/docker-gameboy.live
```