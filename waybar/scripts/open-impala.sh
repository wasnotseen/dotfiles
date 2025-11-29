#!/usr/bin/env bash

# Get JSON list of current clients
clients_json=$(hyprctl -j clients)

# Try to extract an address for Impala’s window
addr=$(echo "$clients_json" | jq -r '.[] | select(.class=="com.omarchy.Impala") | .address' | head -n1)

if [ -n "$addr" ] && [ "$addr" != "null" ]; then
    # Focus window using correct address format
    hyprctl dispatch focuswindow address:$addr
else
    # No existing window found → Launch Impala
    env WAYLAND_DISPLAY="$WAYLAND_DISPLAY" XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" impala &
fi
