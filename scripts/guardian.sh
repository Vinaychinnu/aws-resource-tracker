#!/bin/bash
# Runs all monitoring scripts

# Load logging library
. "$(dirname "$0")/lib/logger.sh"

echo "" >> "$LOG_FILE"


log "INFO" "Guardian Orchestrator started"

case "$1" in
    health)
        ./scripts/health_monitor.sh
        ;;
    watchdog)
        ./scripts/service_watchdog.sh
        ;;
    network)
        ./scripts/network_snapshot.sh
        ;;
    backup)
        ./scripts/backup_logs.sh
        ;;
    all|"")
        ./scripts/health_monitor.sh
        ./scripts/service_watchdog.sh
        ./scripts/network_snapshot.sh
        ./scripts/backup_logs.sh
        ;;
    *)
        echo "Usage: $0 {health|watchdog|network|backup|all}"
        exit 1
        ;;
esac

log "INFO" "Guardian Orchestrator completed"
