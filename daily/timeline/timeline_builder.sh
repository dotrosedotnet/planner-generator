#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# this file will eventually take arguments from the page orchestrator script
# but for now, it will watch the settings and ps files and update a tmp version for viewing

# make tmp folder
# generate timeline.tmp.ps from timeline.ps and timeline_settings.md
#   use default values in case the settings gets messed up/for making the script
# watch timeline.ps and timeline_settings.md for changes
# update timeline.tmp.ps
# delete tmp folder on quit

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
CURRENT_DIR=$(pwd)

if [ "$SCRIPT_DIR" != "$CURRENT_DIR" ]; then
  echo "Error: This script must be run from it's location: $SCRIPT_DIR"
  exit 1
fi

mkdir tmp
cp timeline.ps tmp/
