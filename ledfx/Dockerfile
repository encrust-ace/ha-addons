FROM ghcr.io/ledfx/ledfx:latest

# Switch to root to handle Supervisor volume permissions
USER root

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]