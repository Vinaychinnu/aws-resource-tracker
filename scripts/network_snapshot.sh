#!/bin/bash
# Capture a full network snapshot

echo "==== Network Snapshot ===="

# Section 1: Interfaces
echo "-- Network Interfaces --"
ip addr show
ip link show
echo

# Section 2: Routing
echo "-- Routing Table --"
ip route show
echo

# Section 3: Active Connections
echo "-- Active TCP/UDP Connections (top 10) --"
ss -tunp | head -n 10
echo

# Section 4: Listening Ports
echo "-- Listening Ports --"
netstat -tulpn
echo

# Section 5: ARP Table
echo "-- ARP Table --"
ip neigh show
echo

# Section 6: DNS Servers
echo "-- DNS Resolver --"
cat /etc/resolv.conf
echo

# Section 7: Firewall Rules
echo "-- Firewall Rules --"
iptables -L -n -v
echo

# Section 8: Connectivity Check
echo "-- Connectivity Test --"
ping -c 3 8.8.8.8
echo

# Section 9: Interface Traffic Stats
echo "-- Interface RX/TX Stats --"
ip -s link
echo

echo "=========================="

