#!/usr/bin/env sh

ydotool type -d 0 "$(grep -Ev '^($|#)' ~/.config/bookmarks | rofi -dmenu | cut -d' ' -f1)"
