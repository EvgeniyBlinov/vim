#!/usr/bin/env bash

set -euC

TMUX_SESSION_NAME=work

att() {
    [ -n "${TMUX:-}" ] &&
        tmux switch-client -t "=${TMUX_SESSION_NAME}" ||
        tmux attach-session -t "=${TMUX_SESSION_NAME}"
}

if tmux has-session -t "=${TMUX_SESSION_NAME}" 2> /dev/null; then
    att
    exit 0
fi

tmux new-session -d -s ${TMUX_SESSION_NAME} -n dia -c ~/JOB/diary
tmux send-keys -t "=${TMUX_SESSION_NAME}:=dia" 'mc' Enter

tmux new-window -d -t "=${TMUX_SESSION_NAME}" -n k8s
tmux send-keys -t "=${TMUX_SESSION_NAME}:=k8s" "mc" Enter
tmux send-keys -t "=${TMUX_SESSION_NAME}:=k8s" "^o" Enter
tmux send-keys -t "=${TMUX_SESSION_NAME}:=k8s" "kc" Enter

att
