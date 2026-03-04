FROM ghcr.io/ledfx/ledfx:latest

# Switch to root to perform filesystem operations
USER root

# Remove the default configuration directory and symlink it to the persistent /data volume
RUN rm -rf /home/ledfx/ledfx-config && \
    ln -s /data /home/ledfx/ledfx-config