FROM ghcr.io/ledfx/ledfx:latest

USER root

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]