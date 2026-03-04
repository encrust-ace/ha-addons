#!/bin/bash
echo "Initializing LedFx HAOS Add-on..."

# 1. Handle Persistent Data
# Create the config directory in HA's persistent volume
mkdir -p /data/ledfx-config
chown -R 1000:1000 /data/ledfx-config

# Remove the container's default config path and symlink it to the persistent volume
rm -rf /home/ledfx/ledfx-config
ln -s /data/ledfx-config /home/ledfx/ledfx-config
chown -h 1000:1000 /home/ledfx/ledfx-config

# 2. Set Audio Environment Variables
# Tell LedFx/PulseAudio libraries where Home Assistant's audio socket is
export PULSE_SERVER="unix:/run/audio/plug"

echo "Starting LedFx..."
# 3. Start LedFx
# Drop root privileges and start the app as the ledfx user (UID 1000)
exec su ledfx -c "ledfx --offline --host 0.0.0.0"