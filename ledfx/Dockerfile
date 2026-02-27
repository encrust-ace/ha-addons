ARG BUILD_FROM
FROM ghcr.io/ledfx/ledfx:latest

ENV HOME=/home/ledfx

# Remove upstream ENTRYPOINT (critical)
ENTRYPOINT []

# Copy startup script with correct permissions
COPY --chmod=755 run.sh /run.sh

CMD ["/bin/bash", "/run.sh"]