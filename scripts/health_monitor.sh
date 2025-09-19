#!/bin/bash

# Basic System health monitoring

echo "====System Health Report===="

# CPU Load
echo "CPU Load: $(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1)"

# Memory usage
free -h | awk '/Mem/ {print "Memory usage: " $3 " / " $2}'

# Disk usage
df -h / | awk 'NR==2 {print "Disk usage: " $3 " / " $2 " (" $5 " used)"}'

echo "============================"
