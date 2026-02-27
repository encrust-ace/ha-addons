ARG BUILD_FROM
FROM ghcr.io/ledfx/ledfx:latest

# Home Assistant base image compatibility
ENV HOME=/home/ledfx

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]