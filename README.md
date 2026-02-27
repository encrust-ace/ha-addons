# LedFx Home Assistant Add-on

This add-on runs LedFx inside Home Assistant OS with:
- Ingress UI
- Persistent configuration
- Audio-reactive effects via PulseAudio

## Features
- Web UI via Home Assistant Ingress
- Persistent data stored in /data
- Supports WLED, ESP32, UDP devices

## Limitations
- Clone / graphical entity effects are not supported
- PulseAudio socket sharing is not available in HAOS
- No host networking

## Installation
1. Add this repository to Home Assistant:
   Settings → Add-ons → Add-on Store → Repositories
2. Install **LedFx**
3. Open Web UI

## Audio
Uses Home Assistant PulseAudio backend.