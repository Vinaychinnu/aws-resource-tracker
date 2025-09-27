#!/bin/bash
# Restart critical services if down

# Load logging library
. "$(dirname "$0")/lib/logger.sh"

echo "" >> "$LOG_FILE"

log "INFO" "Starting Service Watchdog"

CONFIG_FILE="./config/services.conf"

while IFS= read -r service; do
    if [[ -z "$service" || "$service" =~ ^# ]]; then
        continue  # skip empty lines or comments
    fi

    if systemctl is-active --quiet "$service"; then
        log "INFO" "OK: $service is running"
    else
        log "WARN" "ALERT: $service is NOT running, attempting restart..."
        sudo systemctl restart "$service"
        if systemctl is-active --quiet "$service"; then
            log "INFO" "SUCCESS: $service restarted"
        else
            log "ERROR" "FAIL: $service could not be restarted"
        fi
    fi
done < "$CONFIG_FILE"

log "INFO" "Service Watchdog completed"
