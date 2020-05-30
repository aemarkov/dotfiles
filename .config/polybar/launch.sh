#!/usr/bin/env bash

# Kill running
killall -q polybar

polybar primary &
polybar secondary &
