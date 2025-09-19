#!/bin/bash
# Script to backup log files

LOG_DIR="/var/log"

BACKUP_DIR="$HOME/log_backups"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Copying logs to backup folder with timestamp
cp -r "$LOG_DIR" "$BACKUP_DIR/logs_$(date +%F_%H-%M)"

echo "Logs backed up to $BACKUP_DIR"
