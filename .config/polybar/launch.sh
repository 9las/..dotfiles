#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch example bar
echo "---" | tee -a /tmp/polybar_example.log
polybar example >> /tmp/polybar_example.log 2>&1 &

echo "Bars launched..."
