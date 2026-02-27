ARG BUILD_FROM
FROM ghcr.io/ledfx/ledfx:latest

ENV HOME=/home/ledfx

# Completely clear upstream entrypoint
ENTRYPOINT []

# Run LedFx directly
CMD ["ledfx", "--host", "0.0.0.0", "--port", "8888", "--config", "/data"]