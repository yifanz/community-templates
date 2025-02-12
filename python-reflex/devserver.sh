#!/bin/sh
source .venv/bin/activate
if [ -n "$PORT" ]; then
  reflex run --frontend-port "$PORT"
else
  reflex run
fi