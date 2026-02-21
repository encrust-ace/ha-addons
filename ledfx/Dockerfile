FROM ghcr.io/ledfx/ledfx:latest

# Switch to root to perform filesystem operations
USER root

# Redirect the configuration directory to /data for persistence
RUN rm -rf /home/ledfx/ledfx-config && \
    ln -s /data /home/ledfx/ledfx-config