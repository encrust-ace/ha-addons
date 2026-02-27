#!/bin/bash
echo "Initializing LedFx HAOS Add-on..."

# 1. Handle Persistent Data
mkdir -p /data/ledfx-config
chown -R 1000:1000 /data/ledfx-config
rm -rf /home/ledfx/ledfx-config
ln -s /data/ledfx-config /home/ledfx/ledfx-config
chown -h 1000:1000 /home/ledfx/ledfx-config

# 2. Set Audio Environment Variables
export PULSE_SERVER="unix:/run/audio/plug"

# 3. Start NGINX Proxy
echo "Starting NGINX Proxy..."
nginx &

# 4. Start LedFx
echo "Starting LedFx..."
exec su ledfx -c "ledfx --offline --host 0.0.0.0 --port 8888"