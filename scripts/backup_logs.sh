#!/bin/bash
# Backup project logs with logging

# Load logging library
. "$(dirname "$0")/lib/logger.sh"

echo "" >> "$LOG_FILE"


BACKUP_DIR="backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date '+%d-%m-%Y_%H:%M')
ARCHIVE="$BACKUP_DIR/logs_backup_$TIMESTAMP.tar.gz"

log "INFO" "Starting log backup"

if [ ! -d "logs" ]; then
    log "ERROR" "No logs directory found to backup"
    exit 1
fi

if tar -czf "$ARCHIVE" logs/ 2>/dev/null; then
    log "INFO" "Logs successfully archived to $ARCHIVE"
else
    log "ERROR" "Failed to create backup archive"
    exit 1
fi

log "INFO" "Log backup completed"
