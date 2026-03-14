#!/usr/bin/env bash
set -e

# mata as barras antigas
killall -q polybar || true

# escolher config
if [[ "$1" == "light" ]]; then
    CONFIG="$HOME/.config/polybar/config-light.ini"
else
    CONFIG="$HOME/.config/polybar/config-dark.ini"
fi

# iniciar
polybar main -c "$CONFIG" &
