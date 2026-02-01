#!/bin/bash

# V-Toggle: Speed-optimized System Control (Custom Messages)
# Triggered by OpenClaw-Manager (DMS Plugin)

STATUS=$1
OPENCLAW_BIN="/home/oki/.npm-global/bin/openclaw"
BOSS_ID="7373004978"

if [ "$STATUS" == "ON" ]; then
    (
        systemctl --user start openclaw-gateway > /dev/null 2>&1 || "$OPENCLAW_BIN" gateway start > /dev/null 2>&1
        "$OPENCLAW_BIN" message send --target "$BOSS_ID" --message "⚡ System is ready" > /dev/null 2>&1
    ) &
elif [ "$STATUS" == "OFF" ]; then
    (
        "$OPENCLAW_BIN" message send --target "$BOSS_ID" --message "💀 System is offline" > /dev/null 2>&1
        systemctl --user stop openclaw-gateway > /dev/null 2>&1 || "$OPENCLAW_BIN" gateway stop > /dev/null 2>&1
        pkill -9 -f "openclaw" > /dev/null 2>&1
    ) &
fi

exit 0
