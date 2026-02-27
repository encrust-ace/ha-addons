FROM ghcr.io/ledfx/ledfx:latest

# Switch to root to handle Supervisor volume permissions
USER root

COPY run.sh /run.sh
RUN chmod +x /run.sh

# Override the base image's entrypoint completely to bypass their PulseAudio script
ENTRYPOINT [ "/run.sh" ]