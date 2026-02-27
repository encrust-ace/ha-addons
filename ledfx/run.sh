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

# 3. The Brute-Force Ingress Patch
echo "Patching LedFx frontend for native Home Assistant Ingress..."
# Locate the frontend directory inside the Python site-packages
FRONTEND_DIR=$(find /usr/local/lib -type d -name "frontend" | grep ledfx | head -n 1)

if [ -n "$FRONTEND_DIR" ]; then
    echo "Frontend found at: $FRONTEND_DIR"
    
    # Step A: Delete pre-compressed files so the server is forced to serve our patched text files
    find "$FRONTEND_DIR" -type f -name "*.gz" -delete
    
    # Step B: Rewrite absolute paths to relative paths in HTML, CSS, and JS
    find "$FRONTEND_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" \) -exec sed -i 's|"/static/|"./static/|g' {} +
    find "$FRONTEND_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" \) -exec sed -i 's|"/api/|"./api/|g' {} +
    find "$FRONTEND_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" \) -exec sed -i 's|href="/|href="./|g' {} +
    find "$FRONTEND_DIR" -type f \( -name "*.html" -o -name "*.js" -o -name "*.css" \) -exec sed -i 's|src="/|src="./|g' {} +
    
    # Step C: Catch Webpack's dynamic chunk loader public path
    find "$FRONTEND_DIR" -type f -name "*.js" -exec sed -E -i 's|\.p="/"|\.p="./"|g' {} +
    
    echo "Patching complete."
else
    echo "Warning: LedFx frontend directory not found. Ingress patch skipped."
fi

# 4. Start LedFx
echo "Starting LedFx..."
exec su ledfx -c "ledfx --offline --host 0.0.0.0 --port 8888"