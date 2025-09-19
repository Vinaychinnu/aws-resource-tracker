#!/bin/bash
# Restart critical services if down

CONFIG_FILE="config/services.conf"

echo "==== Service Watchdog ===="

while IFS= read -r service; do
    if systemctl is-active --quiet "$service"; then
        echo "OK: $service is running"
    else
        echo "ALERT: $service is NOT running, attempting restart..."
        sudo systemctl restart "$service"
        if systemctl is-active --quiet "$service"; then
            echo "SUCCESS: $service restarted"
        else
            echo "FAIL: $service could not be restarted"
        fi
    fi
done < "$CONFIG_FILE"

echo "=========================="
