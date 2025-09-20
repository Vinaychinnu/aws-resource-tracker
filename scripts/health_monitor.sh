#!/bin/bash

# Basic System health monitoring with logging

# Load logging library
. "$(dirname "$0")/lib/logging.sh"

echo "" >> "$LOG_FILE"

log "INFO" "Starting Health Monitor"

echo "====System Health Report===="

# CPU Load
cpu_load=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1)
log "INFO" "Cpu Load: $cpu_load"

# Memory usage
mem_usage=$(free -h | awk '/Mem/ {print "Memory usage: " $3 " / " $2}')
log "INFO" "Memory Usage: $mem_usage"

# Disk usage
disk_usage=$(df -h / | awk 'NR==2 {print "Disk usage: " $3 " / " $2 " (" $5 " used)"}')
log "INFO" "Disk Usage: $disk_usage"

echo "============================"


log "INFO" "Health Monitor completed"
