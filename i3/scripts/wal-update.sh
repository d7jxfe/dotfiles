#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

if [ -n "$WALLPAPER" ]; then
    # 1. Generate colors and set wallpaper
    # The -n flag prevents it from overwriting the wallpaper if you use a separate tool,
    # but since we want it to handle everything, we use default.
    wal -i "$WALLPAPER" -q
    
    # 2. FORCE update the Xresources database (This is what Polybar reads)
    xrdb -merge "$HOME/.cache/wal/colors.Xresources"
    
    # 3. Reload i3
    i3-msg reload
    
    # 4. Restart Polybar
    ~/.config/polybar/launch.sh
fi
