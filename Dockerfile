FROM ubuntu:vivid

MAINTAINER Laurent Grangeau <laurent.grangeau@gmail.com>

# Set some env variables
ENV DEBIAN_FRONTEND noninteractive
ENV BOINC_VERSION 7.4.23+dfsg-2

# Update and install minimal.
RUN apt-get update && apt-get install --yes --no-install-recommends --no-install-suggests boinc-client=${BOINC_VERSION} && apt-get clean && rm -rf /var/lib/apt/lists/*

# Data volume
ONBUILD VOLUME /data

# Getting ready
WORKDIR /data

# Default command
CMD ["/usr/bin/boinc", "--attach_project", "www.worldcommunitygrid.org", "4fc55b3b0bec868577a05bae568b20d0"]