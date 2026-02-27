ARG BUILD_FROM
FROM ghcr.io/ledfx/ledfx:latest

ENV HOME=/home/ledfx

COPY --chmod=755 run.sh /run.sh

ENTRYPOINT ["/run.sh"]