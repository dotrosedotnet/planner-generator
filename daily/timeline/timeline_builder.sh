#!/usr/bin/env bash

################################################################################
# this file will eventually take arguments from the page orchestrator script,
# but for now, it will watch the settings and ps files and update a tmp version
# for viewing
################################################################################

# unofficial bash strict mode
set -euo pipefail IFS=$'\n\t'

# keep the script from running outside of it's directory
readonly SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
readonly CURRENT_DIR=$(pwd)
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

# delete tmp on script complete
trap sigint_proc SIGINT
trap cleanup EXIT

print_changed_file() {
  ls -1tr | tail -1 | awk '{print $1" changed!"}'
}

# TODO: copy ps file to tmp folder and replace settings with
# the settings in settings.md file
#
# test file watching first by just echoing something if either file changes

update_ps() {
  # get array of settings declared in settings file
  local PS_FILE=$(ls | grep .ps)
  local SETTINGS_FILE="${PS_FILE%.*}_settings.md"
  local SETTINGS_NAMES=$(grep "^# " $SETTINGS_FILE)
  while IFS= read -r line; do
    # echo "$line"
    # awk "/$line/{found=1; next} found && /^\W/{print; exit}" "$SETTINGS_FILE"
    # echo "ass"
  done <<< "$SETTINGS_NAMES"
}

watch_files() {
  local LAST_MOD_TIME=$(stat -c %Y .)
  while true; do
    local CURRENT_MOD_TIME=$(stat -c %Y .)
    if [[ "$CURRENT_MOD_TIME" != "$LAST_MOD_TIME" ]]; then
      print_changed_file
      update_ps
      LAST_MOD_TIME="$CURRENT_MOD_TIME"
    fi
    sleep 1
  done
}

mk_tmp_cp_ps() {
  mkdir tmp
  local PS_FILE=$(ls | grep .ps)
  cp $PS_FILE tmp/
}

mk_tmp_cp_ps

watch_files

cleanup
