ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV NAMER_CONFIG=/config/namer.cfg
ENV PATH="/root/.local/bin:$PATH"
ENV TZ=Europe/London
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python3-pip \
       python3 \
       pipx \
       ffmpeg \
       tzdata \
       curl \
       build-essential \
       libffi-dev \
       libssl-dev \
       python3-dev \
       python3-venv \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Install namer
RUN pip3 install --no-cache-dir namer

# Copy root filesystem
COPY rootfs /

# Define arguments from build.yaml
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="YOUR_NAME <YOUR_EMAIL>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Namer Add-on" \
    org.opencontainers.image.authors="YOUR_NAME <YOUR_EMAIL>" \
    org.opencontainers.image.licenses="Apache License 2.0" \
    org.opencontainers.image.url="https://github.com/brunzbrunz" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

# Healthcheck
HEALTHCHECK --interval=1m --timeout=30s CMD curl -s http://localhost:6980/api/healthcheck > /dev/null || exit 1
