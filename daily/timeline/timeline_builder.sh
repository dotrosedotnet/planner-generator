#!/usr/bin/env bash

################################################################################
# this file will eventually take arguments from the page orchestrator script,
# but for now, it will watch the settings and ps files and update a tmp version
# for viewing
################################################################################

# unofficial bash strict mode
set -euo pipefail IFS=$'\n\t'

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

# GAMEPLAN
# - [x] make tmp folder
# - [ ] generate timeline.tmp.ps from timeline.ps and timeline_settings.md
#   - [ ] use default values if there are no matches
# - [ ] watch timeline.ps and timeline_settings.md for changes
# - [ ] update timeline.tmp.ps
# - [x] delete tmp on script complete
# - [x] delete tmp folder on Ctrl+C

cleanup() {
  echo "Cleaning up..."
  rm -rvf tmp
  echo "Cleanup complete."
  exit 1
}

sigint_proc() {
  echo $'\n'$'\n'"Ctrl+C detected."$'\n'
  cleanup
}

LAST_MOD_TIME=$(stat -c $Y .)

PS_FILE=$(ls | grep .ps)
SETTINGS_FILE="${ps_file%.*}_settings.md"

# TODO: copy ps file to tmp folder and replace settings with
# the settings in settings.md file

# delete tmp on script complete
# trap sigint_proc SIGINT
#
# mkdir tmp
# cp timeline.ps tmp/
#
cleanup
