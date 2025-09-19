#!/bin/bash
# Orchestrator for all monitoring scripts

echo "==== Guardian: System Overview ===="

# Running each script
./scripts/health_monitor.sh
./scripts/service_watchdog.sh
./scripts/network_snapshot.sh
./scripts/backup_logs.sh

echo "====== Guardian Run Complete ======"

