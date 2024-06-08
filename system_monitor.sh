#!/bin/bash

# Variables
THRESHOLD_CPU=80
THRESHOLD_MEM=80
THRESHOLD_DISK=80
EMAIL="you@example.com"

# Monitor CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $CPU_USAGE%"

# Monitor Memory usage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
echo "Memory Usage: $MEM_USAGE%"

# Monitor Disk usage
DISK_USAGE=$(df -h / | grep / | awk '{ print $5 }' | sed 's/%//g')
echo "Disk Usage: $DISK_USAGE%"

# Monitor Network activity
if ! command -v ifstat &> /dev/null; then
    echo "ifstat could not be found. Please install it."
    exit 1
fi

NET_USAGE=$(ifstat -t 1 1 | tail -1)
echo "Network Usage: $NET_USAGE"

# Send alert if any usage exceeds the threshold
if (( $CPU_USAGE > $THRESHOLD_CPU )) || 
   (( $MEM_USAGE > $THRESHOLD_MEM )) || 
   [ "$DISK_USAGE" -gt "$THRESHOLD_DISK" ]; then
    echo "Resource usage exceeded threshold"
    # Optionally, you can send email alerts here
fi
