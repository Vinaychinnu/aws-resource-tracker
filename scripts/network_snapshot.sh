#!/bin/bash
# scripts/network_snapshot.sh - Capture a full network snapshot with logging

# Load logging library
. "$(dirname "$0")/lib/logging.sh"

echo "" >> "$LOG_FILE"

log "INFO" "Starting Network Snapshot"

echo "==== Network Snapshot ===="

# Section 1: Interfaces
log "INFO" "Capturing network interfaces"
ip addr show
ip link show
echo

# Section 2: Routing
log "INFO" "Capturing routing table"
ip route show
echo

# Section 3: Active Connections
log "INFO" "Capturing active TCP/UDP connections"
ss -tunp | head -n 10
echo

# Section 4: Listening Ports
log "INFO" "Capturing listening ports"
netstat -tulpn
echo

# Section 5: ARP Table
log "INFO" "Capturing ARP table"
ip neigh show
echo

# Section 6: DNS Servers
log "INFO" "Capturing DNS resolvers"
cat /etc/resolv.conf
echo

# Section 7: Firewall Rules
log "INFO" "Capturing firewall rules"
iptables -L -n -v
echo

# Section 8: Connectivity Check
log "INFO" "Testing connectivity (ping to 8.8.8.8)"
ping -c 3 8.8.8.8
echo

# Section 9: Interface Traffic Stats
log "INFO" "Capturing interface traffic stats"
ip -s link
echo

echo "=========================="

log "INFO" "Network Snapshot completed"
