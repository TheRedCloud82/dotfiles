#!/usr/bin/env bash
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
