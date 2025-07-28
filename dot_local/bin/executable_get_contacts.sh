#!/usr/bin/env sh

ydotool type -d 0 "$(grep -Ev '^($|#)' ~/.config/contacts | rofi -dmenu )"
