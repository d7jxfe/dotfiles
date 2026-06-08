#!/bin/bash

# Get current workspace number
current_num=$(i3-msg -t get_workspaces | python3 -c "import sys,json; ws=json.load(sys.stdin); print([w['name'] for w in ws if w['focused']][0])")

if [ "$1" = "up" ]; then
    [ "$current_num" -lt 4 ] && i3-msg workspace $((current_num + 1)) &
else
    [ "$current_num" -gt 1 ] && i3-msg workspace $((current_num - 1)) &
fi