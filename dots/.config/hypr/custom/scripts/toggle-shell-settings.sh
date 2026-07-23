#!/usr/bin/env bash

set -u

settings_address=$(hyprctl clients -j 2>/dev/null | jq -r '.[] | select(.title == "illogical-impulse Settings") | .address' | head -n 1)

if [[ -n "$settings_address" ]]; then
    hyprctl dispatch closewindow "address:$settings_address" >/dev/null
else
    qs -p "$HOME/.config/quickshell/${qsConfig:-ii}/settings.qml" >/dev/null 2>&1 &
fi
