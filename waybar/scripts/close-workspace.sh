#!/bin/bash

# Get the active workspace ID
ws=$(hyprctl activeworkspace -j | jq -r '.id')

# Get all windows in that workspace
hyprctl clients -j | jq -r ".[] | select(.workspace.id == $ws) | .address" | while read -r addr; do
    hyprctl dispatch closewindow address:$addr
done
