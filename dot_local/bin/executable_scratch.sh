#!/usr/bin/env sh

if [ "$(tmux list-session | grep scratch)" ];then
    st -t scratchpad -g 120x34 tmux attach -t scratch
else
    st -t scratchpad -g 120x34 tmux new -s scratch
fi
