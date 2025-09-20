#!/bin/bash
# Central logging utility for all scripts

LOG_DIR="logs"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/guardian.log"

log() {
    local level="$1"
    local message="$2"
    local timestamp
    timestamp=$(date '+%d/%m/%Y %H:%M')

    # Print to console
    echo "[$timestamp] [$level] $message"

    # Save to log file
    echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
}
