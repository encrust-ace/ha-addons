#!/usr/bin/with-contenv bash
set -e

ARGS=""

if [ "$(jq -r '.offline' /data/options.json)" = "true" ]; then
  ARGS="$ARGS --offline"
fi

if [ "$(jq -r '.clear_effects' /data/options.json)" = "true" ]; then
  ARGS="$ARGS --clear-effects"
fi

echo "Starting LedFx with args: $ARGS"

exec ledfx \
  --host 0.0.0.0 \
  --port 8888 \
  --config /data \
  $ARGS