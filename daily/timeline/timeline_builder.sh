#!/usr/bin/env bash

################################################################################
# this file will eventually take arguments from the page orchestrator script,
# but for now, it will watch the settings and ps files and update a tmp version
# for viewing
################################################################################

# unofficial bash strict mode
set -euo pipefail IFS=$'\n\t'

# GAMEPLAN
# - [x] make tmp folder
# - [ ] generate timeline.tmp.ps from timeline.ps and timeline_settings.md
#   - [ ] use default values if there are no matches
# - [ ] watch timeline.ps and timeline_settings.md for changes
# - [ ] update timeline.tmp.ps
# - [ ] delete tmp folder on quit

# keep the script from running outside of it's directory
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
CURRENT_DIR=$(pwd)

if [ "$SCRIPT_DIR" != "$CURRENT_DIR" ]; then
  echo "Error: This script must be run from it's location: $SCRIPT_DIR"
  exit 1
fi

##=============##
# let's do this #
##=============##

mkdir tmp
cp timeline.ps tmp/
