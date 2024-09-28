#!/bin/sh
set -e

# Start Luzid in the background
/usr/local/bin/luzid &
LUZID_PID=$!

# Function to forward signals to Luzid
forward_signal() {
    kill -$1 $LUZID_PID
}

# Set up signal handlers
trap 'forward_signal TERM' TERM
trap 'forward_signal INT' INT

# Wait for Luzid to exit
wait $LUZID_PID
