# Set base image
FROM golang:1.12.5-alpine3.9

# Define working directory.
WORKDIR /tmp

# Build
RUN \
	apk --update --no-cache upgrade \
	&& apk add --update --no-cache --virtual build-dependencies \
		build-base \
		alsa-lib-dev \
		mesa-dev \
		git \
		libx11-dev \
		libxcursor-dev \
		libxrandr-dev \
		libxinerama-dev \
		libxi-dev \
		musl-dev \
	&& git clone https://github.com/HFO4/gameboy.live.git \
	&& cd gameboy.live \
	&& go build -o gbdotlive main.go \
	&& mv gbdotlive /usr/bin/ \
	# Cleanup
	&& apk del build-dependencies \
	&& rm -rf /tmp/* /tmp/.[!.]*

# Install dependencies
RUN \
	apk add --update --no-cache \
		alsa-lib \
		mesa \
		mesa-gl \
		libx11 \
		libxcursor \
		libxrandr \
		libxinerama \
		libxi \
		musl

# Add files.
COPY /startapp.sh /


# Define mountable directories.
VOLUME ["/data"]

# Expose ports
#	- 1989 custom telnet port for the gameboy emulator
EXPOSE 1989

# Metadata.
LABEL \
	org.label-schema.name="gb.live" \
	org.label-schema.description="Docker container for gb.live Gameboy telnet emulator." \
	org.label-schema.version="unknown" \
	org.label-schema.vcs-url="https://github.com/shokinn/docker-gameboy.live" \
	org.label-schema.schema-version="1.0" \
	maintainer="Philip Henning <mail@philip-henning.com>"

ENTRYPOINT ["/bin/sh", "-c", "/startapp.sh"]