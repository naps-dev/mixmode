#!/bin/bash
set -euo pipefail
if [ -n "$1" ]; then
  FILE="$1"
else
  echo "error: qcow2 file must be defined"
  exit 1
fi

echo "Pushing $"