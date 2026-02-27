#!/bin/bash
echo "Initializing LedFx HAOS Add-on..."

# 1. Handle Persistent Data
# Create the config directory in HA's persistent volume and set ownership
# The ledfx user in the base container operates on UID 1000
mkdir -p /data/ledfx-config
chown -R 1000:1000 /data/ledfx-config

# Remove the container's default config path and symlink it to the persistent volume
rm -rf /home/ledfx/ledfx-config
ln -s /data/ledfx-config /home/ledfx/ledfx-config
chown -h 1000:1000 /home/ledfx/ledfx-config

# 2. Audio Setup
# Home Assistant sets up PULSE_SERVER natively via 'audio: true' in config.yaml.
# Ensure the ledfx user has access to the audio group/socket if necessary.
if [ -S "/run/audio/plug" ]; then
    echo "Home Assistant audio socket detected."
fi

# 3. Start LedFx
# Drop root privileges and start the app as the ledfx user
exec su ledfx -c "ledfx --offline"