#!/usr/bin/env bash

HRES_REF="1366"
HRES=$(xrandr | awk '{print $8}' | head -1)
SET_DISPLAY_PROG="$HOME/.config/i3/scripts/i3-work-displays.sh"

if [ "$HRES" -gt "$HRES_REF" ]
then
	exec "$SET_DISPLAY_PROG"
fi
