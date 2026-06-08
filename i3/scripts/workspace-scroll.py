#!/usr/bin/env python3
import i3
import sys

# Get current workspace number
current = i3.get_workspaces()
ws = next(w for w in current if w['focused'])
current_num = int(ws['name'])

if len(sys.argv) > 1 and sys.argv[1] == 'up':
    if current_num < 4:
        i3.workspace(current_num + 1)
else:
    if current_num > 1:
        i3.workspace(current_num - 1)