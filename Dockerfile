FROM debian:wheezy

MAINTAINER Laurent Grangeau <laurent.grangeau@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Versions.
ENV BOINC_CLIENT 7.0.27+dfsg-5

# Update and install minimal.
RUN \
  apt-get update \
    --quiet \
  && apt-get install \
         --yes \
         --no-install-recommends \
         --no-install-suggests \
       boinc-client=${BOINC_CLIENT} \

# Clean up packages.
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Data volume.
ONBUILD VOLUME /data

# Getting ready.
WORKDIR /data

# Default command.
CMD ["/usr/bin/boinc", "--attach_project", "www.worldcommunitygrid.org", "4fc55b3b0bec868577a05bae568b20d0"]