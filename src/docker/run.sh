#!/usr/bin/env sh

commands='start test'

case "$1" in
  start)
    uvicorn main:app --host "$HOST" --port "$PORT"
    ;;
  test)
    echo "Testing..."
    ;;
  *)
    echo "Unknown command: $1"
    exit 1
    ;;
esac
