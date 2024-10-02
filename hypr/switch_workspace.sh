#!/bin/bash

operation=$1
workspace=$2

monitor_id=$(hyprctl activeworkspace | grep "monitorID" | awk '{print $2}')
workspace_id=$(($monitor_id * 10 + $workspace))
echo "Final Operation: $operation to $workspace_id"

if [[ $operation == "switch" ]]; then
	hyprctl dispatch moveworkspacetomonitor $workspace_id $monitor_id;
	hyprctl dispatch workspace $workspace_id;
fi
if [[ $operation == "move" ]]; then
	hyprctl dispatch moveworkspacetomonitor $workspace_id $monitor_id;
	hyprctl dispatch movetoworkspace $workspace_id;
fi
